package com.project.demo.controller;

import com.project.demo.entity.NetworkRepairReport;
import com.project.demo.service.NetworkRepairReportService;
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
 * 网络报修：(NetworkRepairReport)表控制层
 *
 */
@RestController
@RequestMapping("/network_repair_report")
public class NetworkRepairReportController extends BaseController<NetworkRepairReport, NetworkRepairReportService> {

    /**
     * 网络报修对象
     */
    @Autowired
    public NetworkRepairReportController(NetworkRepairReportService service) {
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
