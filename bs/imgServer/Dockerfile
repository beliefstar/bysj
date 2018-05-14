FROM openjdk:8-jre

RUN mkdir -p /usr/local/imgServer/

COPY img-0.0.1-SNAPSHOT.jar /usr/local/imgServer/

EXPOSE 8090

ENTRYPOINT ["java", "-jar", "/usr/local/imgServer/img-0.0.1-SNAPSHOT.jar"]