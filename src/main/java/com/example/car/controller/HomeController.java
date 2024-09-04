package com.example.car.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.car.entity.Car;
import com.example.car.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private CarService carService;

    // 首页，分页展示车辆列表
    @GetMapping("/")
    public String home(Model model,
                       @RequestParam(required = false) Integer pageNum,
                       @RequestParam(required = false) Integer pageSize) {

        // 设置默认值，当 pageNum 或 pageSize 为 null 时使用默认值
        if (pageNum == null || pageNum < 1) {
            pageNum = 1;
        }
        if (pageSize == null || pageSize < 1) {
            pageSize = 10;
        }

        // 使用 MyBatis-Plus 进行分页查询
        Page<Car> page = carService.page(new Page<>(pageNum, pageSize));

        // 获取当前页的数据列表
        model.addAttribute("carList", page.getRecords());
        model.addAttribute("totalPages", page.getPages());
        model.addAttribute("currentPage", page.getCurrent());
        model.addAttribute("pageSize", pageSize);

        return "index";  // 返回 templates/index.html 页面
    }

    // 车辆详情页面
    @GetMapping("/details/{id}")
    public String carDetails(@PathVariable Long id, Model model) {
        Car car = carService.getById(id);
        model.addAttribute("car", car);
        return "car-details"; // 返回车辆详情页面
    }

    // 更新车辆状态
    @PostMapping("/updateStatus/{id}")
    @ResponseBody
    public Map<String, Object> updateStatus(@PathVariable("id") Long id,
                                            @RequestParam("status") String status) {
        Map<String, Object> result = new HashMap<>();
        Car car = carService.getById(id);
        if (car != null) {
            // 更新车辆状态
            car.setStatus(status);
            boolean updateResult = carService.updateById(car);

            // 判断更新是否成功
            if (updateResult) {
                result.put("success", true);
                result.put("message", "车辆状态已更新为: " + status);

                // 如果状态是套牌车，返回同一街道和路口下的其他可疑车辆
                if ("套牌车".equals(status)) {
                    List<Car> suspiciousCars = carService.list(new QueryWrapper<Car>()
                            .eq("street", car.getStreet())  // 根据街道字段查询
                            .eq("intersection", car.getIntersection())  // 根据路口字段查询
                            .eq("status", "可疑"));  // 查询状态为可疑的车辆
                    result.put("suspiciousCars", suspiciousCars);
                }
            } else {
                result.put("success", false);
                result.put("message", "状态更新失败");
            }
        } else {
            result.put("success", false);
            result.put("message", "未找到车辆");
        }

        return result;
    }


    // 查询同一个监控点的可疑车辆
    @GetMapping("/similarCars")
    @ResponseBody
    public List<Car> findSimilarCars(@RequestParam("monitoringPoint") String monitoringPoint) {
        return carService.list(new QueryWrapper<Car>().eq("monitoring_point", monitoringPoint).eq("status", "可疑"));
    }
}
