package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 宿舍报修：(DormitoryRepairReport)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "DormitoryRepairReport")
public class DormitoryRepairReport implements Serializable {

    // DormitoryRepairReport编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dormitory_repair_report_id")
    private Integer dormitory_repair_report_id;

    // 报修用户
    @Basic
    private Integer repair_user;
    // 姓名
    @Basic
    private String full_name;
    // 宿舍号
    @Basic
    private String dormitory_number;
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
