package com.project.demo.controller;

import com.project.demo.entity.WorkingPersonnel;
import com.project.demo.service.WorkingPersonnelService;
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
 * 工作人员：(WorkingPersonnel)表控制层
 *
 */
@RestController
@RequestMapping("/working_personnel")
public class WorkingPersonnelController extends BaseController<WorkingPersonnel, WorkingPersonnelService> {

    /**
     * 工作人员对象
     */
    @Autowired
    public WorkingPersonnelController(WorkingPersonnelService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapjob_id = new HashMap<>();
        mapjob_id.put("job_id",String.valueOf(paramMap.get("job_id")));
        List listjob_id = service.select(mapjob_id, new HashMap<>()).getResultList();
        if (listjob_id.size()>0){
            return error(30000, "字段工号内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }

}
