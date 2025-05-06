FROM maven:3.9.9-eclipse-temurin-17-alpine AS builder

WORKDIR /app
COPY pom.xml ./
RUN mvn -q dependency:go-offline
COPY src ./src
RUN mvn -q clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

RUN adduser -D appuser
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
RUN chown appuser /app
USER appuser

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
