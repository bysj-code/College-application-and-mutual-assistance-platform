package com.project.demo.controller;

import com.project.demo.entity.OutdoorRepairReport;
import com.project.demo.service.OutdoorRepairReportService;
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
 * 室外报修：(OutdoorRepairReport)表控制层
 *
 */
@RestController
@RequestMapping("/outdoor_repair_report")
public class OutdoorRepairReportController extends BaseController<OutdoorRepairReport, OutdoorRepairReportService> {

    /**
     * 室外报修对象
     */
    @Autowired
    public OutdoorRepairReportController(OutdoorRepairReportService service) {
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
