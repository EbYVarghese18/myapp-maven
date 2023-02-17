
FROM openjdk:11

COPY target/*.jar /

EXPOSE 8010

ENTRYPOINT [ "java", "-jar", "/myapp-maven.jar" ]