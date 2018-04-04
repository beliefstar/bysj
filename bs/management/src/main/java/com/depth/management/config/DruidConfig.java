package com.depth.management.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.sql.SQLException;

@Configuration
public class DruidConfig {

    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.driver-class-name}")
    private String driverClassName;

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    @Value("${spring.druid.initial-size}")
    private int iniSize;

    @Value("${spring.druid.min-idle}")
    private int minIdle;

    @Value("${spring.druid.max-active}")
    private int maxActive;

    @Value("${spring.druid.max-wait}")
    private int maxWait;

    @Value("${spring.druid.time-between-eviction-runs-millis}")
    private long timeBetweenEvictionRunsMillis;

    @Value("${spring.druid.min-evictable-idle-time-millis}")
    private long minEvictableIdleTimeMillis;

    @Value("${spring.druid.validation-query}")
    private String validationQuery;

    @Value("${spring.druid.test-while-idle}")
    private boolean testWhileIdle;

    @Value("${spring.druid.test-on-borrow}")
    private boolean testOnBorrow;

    @Value("${spring.druid.test-on-return}")
    private boolean testOnReturn;

    @Value("${spring.druid.pool-prepared-statements}")
    private boolean poolPreparedStatements;

    @Value("${spring.druid.max-pool-prepared-statement-per-connection-size}")
    private int mppspcs;

    @Value("${spring.druid.filters}")
    private String filters;

    @Bean
    @Primary
    public DataSource dataSource() {
        DruidDataSource source = new DruidDataSource();

        source.setUrl(url);
        source.setDriverClassName(driverClassName);
        source.setUsername(username);
        source.setPassword(password);

        source.setInitialSize(iniSize);
        source.setMinIdle(minIdle);
        source.setMaxActive(maxActive);
        source.setMaxWait(maxWait);
        source.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
        source.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
        source.setValidationQuery(validationQuery);
        source.setTestWhileIdle(testWhileIdle);
        source.setTestOnBorrow(testOnBorrow);
        source.setTestOnReturn(testOnReturn);
        source.setPoolPreparedStatements(poolPreparedStatements);
        source.setMaxPoolPreparedStatementPerConnectionSize(mppspcs);

        try {
            source.setFilters(filters);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return source;
    }

    @Bean
    @Primary
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }
}
