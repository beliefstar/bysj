package com.depth.management.service;

import org.elasticsearch.search.aggregations.Aggregation;

import java.util.Map;

public interface AnalyzeService {
    Map<String, Aggregation> companyProbability(String timeRange);


    Map<String, Aggregation> companySHAvg(String timeRange);

}
