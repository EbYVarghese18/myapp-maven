
# FROM openjdk:11

# COPY target/*.jar /

# EXPOSE 8010

# ENTRYPOINT [ "java", "-jar", "/myapp-maven.jar" ]



# build stage

# FROM maven:3.6.0-jdk-11-slim AS build

# COPY my-app/src /home/app/src

# COPY my-app/pom.xml /home/app

# RUN mvn -f /home/app/pom.xml clean package

# # package stage

# FROM openjdk:11-jre-slim

# COPY --from=build /home/app/target/myapp-maven.jar /usr/local/lib/myapp-maven.jar

# EXPOSE 8010

# ENTRYPOINT [ "java", "-jar", "usr/local/lib/myapp-maven.jar" ]





FROM openjdk:11
EXPOSE 9020
WORKDIR /app
ADD ./target/myapp-maven.jar myapp-maven.jar
ENTRYPOINT ["java","-jar","myapp-maven.jar"]

