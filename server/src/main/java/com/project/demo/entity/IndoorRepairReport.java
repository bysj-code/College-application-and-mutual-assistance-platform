package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 室内报修：(IndoorRepairReport)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "IndoorRepairReport")
public class IndoorRepairReport implements Serializable {

    // IndoorRepairReport编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "indoor_repair_report_id")
    private Integer indoor_repair_report_id;

    // 报修用户
    @Basic
    private Integer repair_user;
    // 姓名
    @Basic
    private String full_name;
    // 报修日期
    @Basic
    private Timestamp repair_date;
    // 选择区域
    @Basic
    private String select_region;
    // 具体位置
    @Basic
    private String specific_location;
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
