package com.project.demo.controller;

import com.project.demo.entity.UserFeedback;
import com.project.demo.service.UserFeedbackService;
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
 * 用户反馈：(UserFeedback)表控制层
 *
 */
@RestController
@RequestMapping("/user_feedback")
public class UserFeedbackController extends BaseController<UserFeedback, UserFeedbackService> {

    /**
     * 用户反馈对象
     */
    @Autowired
    public UserFeedbackController(UserFeedbackService service) {
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
