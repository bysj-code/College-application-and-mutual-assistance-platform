package com.project.demo.controller;

import com.project.demo.entity.DormitoryRepairReport;
import com.project.demo.service.DormitoryRepairReportService;
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
 * 宿舍报修：(DormitoryRepairReport)表控制层
 *
 */
@RestController
@RequestMapping("/dormitory_repair_report")
public class DormitoryRepairReportController extends BaseController<DormitoryRepairReport, DormitoryRepairReportService> {

    /**
     * 宿舍报修对象
     */
    @Autowired
    public DormitoryRepairReportController(DormitoryRepairReportService service) {
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
