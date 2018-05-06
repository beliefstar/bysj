FROM openjdk:8-jre

RUN mkdir -p /usr/local/management/

COPY management-0.0.1-SNAPSHOT.jar /usr/local/management/

EXPOSE 8089

# 配置容器启动后执行的命令，并且不可被 docker run 提供的参数覆盖，而CMD是可以被覆盖的
# docker logs -f -t --since="2017-05-31" --tail=10 edu_web_1 查看日志
ENTRYPOINT ["java", "-jar", "/usr/local/management/management-0.0.1-SNAPSHOT.jar"]