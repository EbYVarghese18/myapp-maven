
FROM openjdk:11

EXPOSE 8010

USER myuser

RUN mkdir /home/myuser && chown myuser:myuser /home/myuser

ADD my-app/target/myapp-maven.jar myapp-maven.jar 

RUN chmod 644 /myapp-maven.jar

ENTRYPOINT [ "java", "-jar", "/myapp-maven.jar" ]