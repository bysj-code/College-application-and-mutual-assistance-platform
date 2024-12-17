package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 文章分类：(ArticleClassification)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "ArticleClassification")
public class ArticleClassification implements Serializable {

    // ArticleClassification编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "article_classification_id")
    private Integer article_classification_id;

    // 文章类型
    @Basic
    private String article_type;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
