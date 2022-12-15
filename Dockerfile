FROM maven:3-openjdk-18-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package


FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/spring-boot-web.jar /usr/local/lib/spring-boot-web.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/spring-boot-web.jar"]
