package com.example.car.controller;

import com.example.car.entity.Car;
import com.example.car.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 车辆控制器，处理前端请求
 */
@RestController
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarService carService;

    /**
     * 获取所有车辆信息
     * @return 车辆列表
     */
    @GetMapping("/list")
    public List<Car> getAllCars() {
        return carService.list();  // 返回所有车辆信息
    }

    /**
     * 根据ID获取单个车辆信息
     * @param id 车辆ID
     * @return 车辆信息
     */
    @GetMapping("/{id}")
    public Car getCarById(@PathVariable Long id) {
        return carService.getById(id);  // 根据ID查询车辆信息
    }

    /**
     * 添加新车辆
     * @param car 车辆信息
     * @return 是否成功
     */
    @PostMapping("/add")
    public boolean addCar(@RequestBody Car car) {
        return carService.save(car);  // 保存车辆信息到数据库
    }

    /**
     * 更新车辆信息
     * @param car 车辆信息
     * @return 是否成功
     */
    @PutMapping("/update")
    public boolean updateCar(@RequestBody Car car) {
        return carService.updateById(car);  // 更新数据库中的车辆信息
    }

    /**
     * 删除车辆
     * @param id 车辆ID
     * @return 是否成功
     */
    @DeleteMapping("/delete/{id}")
    public boolean deleteCar(@PathVariable Long id) {
        return carService.removeById(id);  // 根据ID删除车辆
    }
}
