package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 职工反馈：(EmployeeFeedback)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "EmployeeFeedback")
public class EmployeeFeedback implements Serializable {

    // EmployeeFeedback编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_feedback_id")
    private Integer employee_feedback_id;

    // 反馈用户
    @Basic
    private Integer feedback_to_users;
    // 姓名
    @Basic
    private String full_name;
    // 反馈日期
    @Basic
    private Timestamp feedback_date;
    // 反馈内容
    @Basic
    private String feedback_content;



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
