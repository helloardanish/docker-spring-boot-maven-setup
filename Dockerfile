# Stage 1: Build
FROM maven:3.9.8-amazoncorretto-21 AS build

WORKDIR /service
COPY test-service/pom.xml ./
COPY test-service/src ./src
RUN mvn clean package

# Stage 2: Run
FROM amazoncorretto:21-alpine

WORKDIR /service
COPY --from=build /service/target/test-service-*.jar /service/test-service.jar
EXPOSE 8080
CMD ["java", "-jar", "/service/test-service.jar"]