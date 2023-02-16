
FROM openjdk:11

EXPOSE 8010

ADD my-app/target/myapp-maven.jar myapp-maven.jar 

ENTRYPOINT [ "java", "-jar", "/myapp-maven.jar" ]
