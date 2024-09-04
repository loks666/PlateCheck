package com.example.car.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.car.entity.Car;
import com.example.car.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private CarService carService;

    @GetMapping("/")
    public String home(Model model,
                       @RequestParam(required = false) String pageNum,
                       @RequestParam(required = false) String pageSize) {

        // 检查pageNum和pageSize是否为null字符串，转换为null
        Integer page = null;
        Integer size = null;

        if (pageNum != null && !pageNum.equals("null")) {
            try {
                page = Integer.parseInt(pageNum);
            } catch (NumberFormatException e) {
                page = 1; // 默认值
            }
        } else {
            page = 1; // 默认值
        }

        if (pageSize != null && !pageSize.equals("null")) {
            try {
                size = Integer.parseInt(pageSize);
            } catch (NumberFormatException e) {
                size = 10; // 默认值
            }
        } else {
            size = 10; // 默认值
        }

        // 使用 MyBatis-Plus 进行分页查询
        Page<Car> resultPage = carService.page(new Page<>(page, size));

        // 获取当前页的数据列表
        model.addAttribute("carList", resultPage.getRecords());
        model.addAttribute("totalPages", resultPage.getPages());
        model.addAttribute("currentPage", resultPage.getCurrent());
        model.addAttribute("pageSize", size);

        return "index";  // 返回 templates/index.html 页面
    }
}
