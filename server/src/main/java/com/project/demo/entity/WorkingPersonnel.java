package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 工作人员：(WorkingPersonnel)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "WorkingPersonnel")
public class WorkingPersonnel implements Serializable {

    // WorkingPersonnel编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "working_personnel_id")
    private Integer working_personnel_id;

    // 工号
    @Basic
    private String job_id;
    // 姓名
    @Basic
    private String full_name;
    // 性别
    @Basic
    private String gender;












    // 用户编号
    @Id
    @Column(name = "user_id")
    private Integer userId;


    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
