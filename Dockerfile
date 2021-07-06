FROM gradle:7.0.2-jdk8 AS builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle clean build 

FROM openjdk:8-jre-slim
COPY --from=builder /home/gradle/src/build/libs/spring-petclinic-kotlin-2.4.0.jar /Applications/
ENTRYPOINT ["java", "-jar","/Applications/spring-petclinic-kotlin-2.4.0.jar"]
