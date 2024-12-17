package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 职工文章：(EmployeeArticles)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "EmployeeArticles")
public class EmployeeArticles implements Serializable {

    // EmployeeArticles编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_articles_id")
    private Integer employee_articles_id;

    // 文章标题
    @Basic
    private String article_title;
    // 发布日期
    @Basic
    private Timestamp release_date;
    // 文章类型
    @Basic
    private String article_type;
    // 文章封面
    @Basic
    private String article_cover;
    // 发布职工
    @Basic
    private Integer release_employees;
    // 文章内容
    @Basic
    private String article_content;

    // 点击数
    @Basic
    private Integer hits;

    // 点赞数
    @Basic
    private Integer praise_len;












    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
