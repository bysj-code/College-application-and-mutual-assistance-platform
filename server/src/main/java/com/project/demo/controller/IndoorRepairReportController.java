package com.project.demo.controller;

import com.project.demo.entity.IndoorRepairReport;
import com.project.demo.service.IndoorRepairReportService;
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
 * 室内报修：(IndoorRepairReport)表控制层
 *
 */
@RestController
@RequestMapping("/indoor_repair_report")
public class IndoorRepairReportController extends BaseController<IndoorRepairReport, IndoorRepairReportService> {

    /**
     * 室内报修对象
     */
    @Autowired
    public IndoorRepairReportController(IndoorRepairReportService service) {
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
