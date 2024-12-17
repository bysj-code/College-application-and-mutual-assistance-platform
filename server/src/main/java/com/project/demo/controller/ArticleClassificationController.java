package com.project.demo.controller;

import com.project.demo.entity.ArticleClassification;
import com.project.demo.service.ArticleClassificationService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;


/**
 * 文章分类：(ArticleClassification)表控制层
 *
 */
@RestController
@RequestMapping("/article_classification")
public class ArticleClassificationController extends BaseController<ArticleClassification, ArticleClassificationService> {

    /**
     * 文章分类对象
     */
    @Autowired
    public ArticleClassificationController(ArticleClassificationService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
