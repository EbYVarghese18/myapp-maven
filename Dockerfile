FROM maven:3.8.4-jdk-11-slim AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src/ ./src/

RUN mvn package

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build my-app/target/myapp-maven.jar .

CMD ["java", "-jar", "myapp-maven.jar"]


# FROM openjdk:11
# EXPOSE 8010
# COPY my-app/target/myapp-maven.jar myapp-maven.jar 
# ENTRYPOINT [ "java", "-jar", "myapp-maven.jar" ]
