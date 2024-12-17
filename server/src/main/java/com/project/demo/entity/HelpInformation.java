package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 互助信息：(HelpInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "HelpInformation")
public class HelpInformation implements Serializable {

    // HelpInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "help_information_id")
    private Integer help_information_id;

    // 求助标题
    @Basic
    private String help_title;
    // 求助类型
    @Basic
    private String type_of_help_sought;
    // 求助日期
    @Basic
    private Timestamp date_of_assistance;
    // 发布用户
    @Basic
    private Integer publish_users;
    // 求助内容
    @Basic
    private String help_content;
    // 备注信息
    @Basic
    private String remarks;



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
