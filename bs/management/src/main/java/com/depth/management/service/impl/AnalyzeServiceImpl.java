package com.depth.management.service.impl;

import com.depth.management.common.exception.ServiceException;
import com.depth.management.model.Emp;
import com.depth.management.model.SalaryHistory;
import com.depth.management.service.AnalyzeService;
import com.depth.management.service.EmpService;
import com.depth.management.service.SalaryHistoryService;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.query.IndexQuery;
import org.springframework.data.elasticsearch.core.query.IndexQueryBuilder;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.PostConstruct;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class AnalyzeServiceImpl implements AnalyzeService {

    @Autowired
    private EmpService empService;

    @Autowired
    private SalaryHistoryService salaryHistoryService;

    @Autowired
    private ElasticsearchTemplate template;

    @Override
    public Map<String, Aggregation> companyProbability(String timeRange) {

        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

        Date startTime;
        Date endTime;

        if (!StringUtils.isEmpty(timeRange)) {
            String[] split = timeRange.split("-");
            try {
                startTime = sdf.parse(split[0].trim());
                endTime = sdf.parse(split[1].trim());
            } catch (ParseException e) {
                e.printStackTrace();
                throw new ServiceException(e);
            }
        } else {
            throw new ServiceException("参数错误！");
        }

        FilterAggregationBuilder in = AggregationBuilders.filter("in")
                .filter(QueryBuilders.boolQuery()
                        .filter(QueryBuilders.existsQuery("joinTime"))
                        .filter(
                                QueryBuilders.rangeQuery("joinTime")
                                        .lte(endTime)
                                        .gte(startTime)
                        ))
                .subAggregation(
                    AggregationBuilders.dateHistogram("in")
                        .field("joinTime")
                        .interval(DateHistogramInterval.MONTH)
                        .format("MM/dd/yyyy")
                        .minDocCount(0)
                        .extendedBounds(sdf.format(startTime), sdf.format(endTime))
        );

        FilterAggregationBuilder out = AggregationBuilders.filter("out")
                .filter(QueryBuilders.termQuery("delFlg", "1"))
                .subAggregation(
                    AggregationBuilders.dateHistogram("out")
                        .field("updateTime")
                        .interval(DateHistogramInterval.MONTH)
                        .format("MM/dd/yyyy")
                        .minDocCount(0)
                        .extendedBounds(sdf.format(startTime), sdf.format(endTime))
        );

        NativeSearchQuery searchQuery = new NativeSearchQueryBuilder()
            .withPageable(new PageRequest(1, 1))
            .addAggregation(in)
            .addAggregation(out)
            .build();

        Aggregations aggs = template.query(searchQuery, SearchResponse::getAggregations);
        return aggs.asMap();
    }

    @Override
    public Map<String, Aggregation> companySHAvg(String timeRange) {

        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

        Date startTime;
        Date endTime;

        if (!StringUtils.isEmpty(timeRange)) {
            String[] split = timeRange.split("-");
            try {
                startTime = sdf.parse(split[0].trim());
                endTime = sdf.parse(split[1].trim());
            } catch (ParseException e) {
                e.printStackTrace();
                throw new ServiceException(e);
            }
        } else {
            throw new ServiceException("参数错误！");
        }

        FilterAggregationBuilder in = AggregationBuilders.filter("wall")
                .filter(QueryBuilders.boolQuery()
                        .filter(
                                QueryBuilders.rangeQuery("createTime")
                                        .lte(endTime)
                                        .gte(startTime)
                        ))
                .subAggregation(
                        AggregationBuilders.dateHistogram("aa")
                                .field("createTime")
                                .interval(DateHistogramInterval.MONTH)
                                .format("MM/dd/yyyy")
                                .minDocCount(0)
                                .extendedBounds(sdf.format(startTime), sdf.format(endTime))
                        .subAggregation(
                                AggregationBuilders.avg("avg")
                                .field("salary")
                        )
                );
        NativeSearchQuery searchQuery = new NativeSearchQueryBuilder()
                .withPageable(new PageRequest(1, 1))
                .addAggregation(in)
                .build();

        Aggregations aggs = template.query(searchQuery, SearchResponse::getAggregations);
        return aggs.asMap();
    }

    @PostConstruct
    public void initData() {

        new Thread(() -> {
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            NativeSearchQuery searchQuery = new NativeSearchQueryBuilder()
                    .withIndices("management")
                    .withTypes("emp")
                    .build();
            long count = 0;
            boolean flag = false;
            try {
                count = template.count(searchQuery);
            } catch (Exception e) {
//                e.printStackTrace();
                flag = true;
            }
            flag = count <= 0;
            if (!flag) return;
            System.out.println("开始初始化数据");
            template.createIndex(Emp.class);
            template.putMapping(Emp.class);
            List<Emp> emps = empService.findTrueAll();
            List<IndexQuery> list = new ArrayList<>();
            for (Emp emp : emps) {
                IndexQuery indexQuery = new IndexQueryBuilder()
                        .withIndexName("management")
                        .withType("emp")
                        .withObject(emp)
                        .build();
                list.add(indexQuery);
            }
            template.bulkIndex(list);
        }).start();
    }

    @PostConstruct
    public void initShData() {

        new Thread(() -> {
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            NativeSearchQuery searchQuery = new NativeSearchQueryBuilder()
                    .withIndices("management")
                    .withTypes("sh")
                    .build();
            long count = 0;
            boolean flag = false;
            try {
                count = template.count(searchQuery);
            } catch (Exception e) {
//                e.printStackTrace();
                flag = true;
            }
            flag = count <= 0;
            if (!flag) return;
            System.out.println("开始初始化数据");

            template.createIndex(SalaryHistory.class);
            template.putMapping(SalaryHistory.class);
            List<SalaryHistory> all = salaryHistoryService.findAll();
            List<IndexQuery> list2 = new ArrayList<>();
            for (SalaryHistory sh : all) {
                IndexQuery indexQuery = new IndexQueryBuilder()
                        .withIndexName("management")
                        .withType("sh")
                        .withObject(sh)
                        .build();
                list2.add(indexQuery);
            }
            template.bulkIndex(list2);
        }).start();
    }
}
