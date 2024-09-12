# Stage 1: Build dependencies only (no source code yet)
FROM maven:3.9.8-amazoncorretto-21 AS build

WORKDIR /service

# Only copy pom.xml to cache Maven dependencies
COPY test-service/pom.xml ./
RUN mvn dependency:go-offline

# Running mvn dependency:go-offline downloads all the required dependencies based on the pom.xml.
# Since Docker caches each layer, if the pom.xml does not change, Docker will use the cached result of this step the next time it builds the container.

# Stage 2: Runtime container with source code
FROM amazoncorretto:21-alpine

WORKDIR /service

# Install Maven to run in development mode
RUN apk add --no-cache maven

# Copy source code to container (optional, but needed for first-time run)
COPY test-service /service

# Expose application port
EXPOSE 8080

# Run with Spring Boot DevTools for live reload
CMD ["mvn", "spring-boot:run"]
