package com.depth.management.controller;

import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.service.*;
import com.depth.management.session.LoginInfo;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.bucket.filter.InternalFilter;
import org.elasticsearch.search.aggregations.bucket.histogram.InternalHistogram;
import org.elasticsearch.search.aggregations.metrics.avg.InternalAvg;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/analyze")
public class AnalyzeController {


    @Autowired
    private AnalyzeService analyzeService;

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private EmpService empService;

    @Autowired
    private DepartmentService departmentService;

    private String view(String str) {
        return "/analyze/" + str;
    }

    @GetMapping("/probability")
    public String probability(String timeRange, ModelMap modelMap) {

        timeRange = StringUtils.isEmpty(timeRange) ? "01/01/2018-12/31/2018" : timeRange;

        modelMap.put("timeRange", timeRange);

        Map<String, Aggregation> map = analyzeService.companyProbability(timeRange);

        InternalFilter in = (InternalFilter) map.get("in");
        InternalHistogram<InternalHistogram.Bucket> aggregationsIn = (InternalHistogram<InternalHistogram.Bucket>) in.getAggregations().asList().get(0);

        List<InternalHistogram.Bucket> bucketsIn = aggregationsIn.getBuckets();

        modelMap.put("inLevel", bucketsIn);

        InternalFilter out = (InternalFilter) map.get("out");
        InternalHistogram<InternalHistogram.Bucket> aggregationsOut = (InternalHistogram<InternalHistogram.Bucket>) out.getAggregations().asList().get(0);

        List<InternalHistogram.Bucket> bucketsOut = aggregationsOut.getBuckets();
        modelMap.put("outLevel", bucketsOut);

        List<String> label = new ArrayList<>();
        for (InternalHistogram.Bucket bucket : bucketsIn) {
            DateTime date = (DateTime) bucket.getKey();
            label.add(date.toString("yyyy/MM"));
        }
        modelMap.put("itemLabel", label);
        return view("index");
    }



    @GetMapping("/average")
    public String avg(Long departmentId, String timeRangeAttendance, String timeRangeAvg, ModelMap modelMap, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();

        if (timeRangeAvg == null) {
            timeRangeAvg = "01/01/2017-12/30/2017";
        }
        modelMap.put("timeRangeAvg", timeRangeAvg);

        Map<String, Aggregation> map = analyzeService.companySHAvg(timeRangeAvg);
        InternalFilter wall = (InternalFilter) map.get("wall");
        InternalHistogram<InternalHistogram.Bucket> aggregation = (InternalHistogram<InternalHistogram.Bucket>) wall.getAggregations().asList().get(0);
        List<InternalHistogram.Bucket> buckets = aggregation.getBuckets();
        List<Double> avgList = new ArrayList<>();
        List<String> avgLabel = new ArrayList<>();
        for (InternalHistogram.Bucket bucket : buckets) {
            DateTime date = (DateTime) bucket.getKey();
            InternalAvg avg = (InternalAvg) bucket.getAggregations().asList().get(0);
            avgLabel.add(date.toString("yyyy/MM"));
            double val = 0;
            if (!Double.isNaN(avg.getValue())) {
                val = avg.getValue();
            }
            avgList.add(val);
        }

        modelMap.put("salary", avgList);
        modelMap.put("salaryLabel", avgLabel);

        if (departmentId == null) {
            departmentId = loginEmp.getDepartmentId();
        }

        if (timeRangeAttendance == null) {
            timeRangeAttendance = "04/01/2018-04/30/2018";
        }
        modelMap.put("timeRangeAttendance", timeRangeAttendance);

        List<AttendanceVo> attendanceVoList = attendanceService.findByDepartmentId(departmentId, timeRangeAttendance);
        List<Emp> emps = empService.findAll();
        int empNumber = emps.size();
        AttendanceVo vo = new AttendanceVo();
        vo.setOutNumber(0);
        vo.setLastNumber(0);
        vo.setLeaveNumber(0);
        for (AttendanceVo attendanceVo : attendanceVoList) {
            if (attendanceVo.getLeaveNumber() != null && !attendanceVo.getLeaveNumber().equals(0)) {
                vo.setLeaveNumber(vo.getLeaveNumber() + 1);
            }
            if (attendanceVo.getOutNumber() != null && !attendanceVo.getOutNumber().equals(0)) {
                vo.setOutNumber(vo.getOutNumber() + 1);
            }
            if (attendanceVo.getLastNumber() != null && !attendanceVo.getLastNumber().equals(0)) {
                vo.setLastNumber(vo.getLastNumber() + 1);
            }
        }
        int normal = empNumber - vo.getLastNumber() - vo.getOutNumber() - vo.getLeaveNumber();

        normal = normal < 0 ? 0 : normal;
        modelMap.put("normal", normal);

        modelMap.put("attendanceVo", vo);

        List<Department> departments = departmentService.findAll();
        modelMap.put("departmentList", departments);
        return view("avg");
    }
}
