package com.example.car.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.car.entity.Car;
import com.example.car.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarService carService;

    // 显示车辆详情页面
    @GetMapping("/details/{id}")
    public String showCarDetails(@PathVariable("id") Long id, Model model) {
        Car car = carService.getById(id);
        model.addAttribute("car", car);
        return "car-details";  // 返回车辆详情页面
    }

    // 更新车辆状态
    @PostMapping("/updateStatus")
    public String updateCarStatus(@RequestParam("carId") Long carId, @RequestParam("status") String status, Model model) {
        Car car = carService.getById(carId);

        if (car != null) {
            // 根据不同按钮的操作设置不同状态
            if (status.equals("duplicate")) {
                car.setStatus("套牌车");
                // 查询相同监控点下的其他套牌车
                List<Car> suspiciousCars = carService.findCarsByStreetAndIntersectionAndStatus(car.getStreet(), car.getIntersection(), "套牌车");
                model.addAttribute("suspiciousCars", suspiciousCars); // 将查询到的可疑车辆传递给前端显示
            } else if (status.equals("nonDuplicate")) {
                car.setStatus("非套牌车");
            } else if (status.equals("suspicious")) {
                car.setStatus("存疑");
            }

            carService.updateById(car);
            model.addAttribute("message", "状态更新成功");
        } else {
            model.addAttribute("message", "车辆未找到");
        }

        return "redirect:/car/details/" + carId;  // 重定向到详情页，并在页面显示结果
    }

    @GetMapping("/accompanyingCars")
    public String accompanyingCars(@RequestParam(value = "intersection", required = false) String intersection, Model model) {
        // 如果 intersection 为 null 或为空，查询为空的车辆列表
        List<Car> carList;
        if (intersection == null || intersection.isEmpty()) {
            carList = List.of();  // 返回一个空的列表
        } else {
            // 查询具有相同路口信息的车辆
            carList = carService.list(new QueryWrapper<Car>()
                    .eq("intersection", intersection));
        }

        // 将车辆列表添加到模型中，传递给页面
        model.addAttribute("carList", carList);
        model.addAttribute("intersection", intersection != null ? intersection : "无路口信息");  // 提供默认信息
        return "accompanying-cars";  // 返回伴随车辆页面
    }


}
