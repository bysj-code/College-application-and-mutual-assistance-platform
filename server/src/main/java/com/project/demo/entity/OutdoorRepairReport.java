package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 室外报修：(OutdoorRepairReport)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "OutdoorRepairReport")
public class OutdoorRepairReport implements Serializable {

    // OutdoorRepairReport编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "outdoor_repair_report_id")
    private Integer outdoor_repair_report_id;

    // 报修用户
    @Basic
    private Integer repair_user;
    // 姓名
    @Basic
    private String full_name;
    // 报修日期
    @Basic
    private Timestamp repair_date;
    // 报修内容
    @Basic
    private String repair_content;
    // 报修状态
    @Basic
    private String repair_status;
    // 维修记录
    @Basic
    private String maintenance_records;
    // 维修人员
    @Basic
    private Integer repair_personnel;



    // 审核状态
    @Basic
    private String examine_state;





    // 当前位置
    @Basic
    private String location_address;
    // 当前位置经度
    @Basic
    private String location_lng;
    // 当前位置纬度
    @Basic
    private String location_lat;



    // 审核回复
    @Basic
    private String examine_reply;



    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
