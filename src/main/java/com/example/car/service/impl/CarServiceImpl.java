package com.example.car.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.car.entity.Car;
import com.example.car.mapper.CarMapper;
import com.example.car.service.CarService;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl extends ServiceImpl<CarMapper, Car> implements CarService {
    // 继承了 ServiceImpl 并实现了 CarService，不需要额外的方法定义，MyBatis-Plus 已经提供了默认的 CRUD 功能
}
