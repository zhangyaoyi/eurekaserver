FROM adoptopenjdk:8-jdk-hotspot

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV EUREKA_SERVER_HOME /usr/local/eurekaserver
RUN mkdir -p $EUREKA_SERVER_HOME
WORKDIR $EUREKA_SERVER_HOME
ADD target/eurekaserver-1.0.jar eurekaserver.jar

EXPOSE 10000
ENTRYPOINT ["java -jar eurekaserver.jar", "--spring.profiles.active="]
CMD ["profile"]

