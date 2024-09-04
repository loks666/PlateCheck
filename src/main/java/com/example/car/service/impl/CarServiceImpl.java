package com.example.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.car.entity.Car;
import com.example.car.mapper.CarMapper;
import com.example.car.service.CarService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl extends ServiceImpl<CarMapper, Car> implements CarService {

    @Override
    public List<Car> findCarsByStreetAndIntersectionAndStatus(String street, String intersection, String status) {
        // 使用 QueryWrapper 来构造条件查询
        QueryWrapper<Car> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("street", street)
                .eq("intersection", intersection)
                .eq("status", status);

        return this.list(queryWrapper);
    }

}

