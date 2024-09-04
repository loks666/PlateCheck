package com.example.car.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.car.entity.Car;
import com.example.car.mapper.CarMapper;
import com.example.car.service.CarService;
import org.springframework.stereotype.Service;

/**
 * 车辆服务实现类
 */
@Service
public class CarServiceImpl extends ServiceImpl<CarMapper, Car> implements CarService {
    // 可以在此处实现额外的业务逻辑
}
