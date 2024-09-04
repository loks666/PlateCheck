package com.example.car.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.car.entity.Car;

import java.util.List;

public interface CarService extends IService<Car> {
    // 定义根据监控点和状态查询车辆的方法
    public List<Car> findCarsByStreetAndIntersectionAndStatus(String street, String intersection, String status);

}
