package com.example.car.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDateTime;


/**
 * 车辆实体类，对应数据库表 car
 */
@Data
@TableName("car")  // 对应数据库表名
public class Car {
    @TableId
    private Long id;  // 主键

    @TableField("license_plate")
    private String licensePlate;   // 车牌号

    @TableField("model")
    private String model;          // 车辆类型

    @TableField("brand")
    private String brand;          // 车辆品牌

    @TableField("color")
    private String color;          // 车辆颜色

    @TableField("speed")
    private Integer speed;         // 行驶速度

    @TableField("over_speed")
    private Boolean overSpeed;     // 是否超速

    @TableField("illegal_driving")
    private Boolean illegalDriving; // 是否违规驾驶

    @TableField("time")
    private LocalDateTime time;    // 检测时间

    @TableField("status")  // 添加状态字段
    private String status;         // 车辆状态 (如: 套牌车、非套牌车、存疑)

    @TableField("img")
    private String img;            // 图片路径

    @TableField("street")  // 新的字段
    private String street;

    @TableField("intersection")  // 新的字段
    private String intersection;
}
