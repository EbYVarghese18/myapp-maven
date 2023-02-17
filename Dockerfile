
# FROM openjdk:11

# EXPOSE 8010

# # ENV HOME=/usr/app

# # RUN mkdir -p $HOME

# # WORKDIR $HOME

# USER myuser

# RUN mkdir /home/myuser && chown myuser:myuser /home/myuser

# ADD my-app/target/myapp-maven.jar myapp-maven.jar 

# RUN chmod 644 /myapp-maven.jar

# ENTRYPOINT [ "java", "-jar", "/myapp-maven.jar" ]

FROM openjdk:11

EXPOSE 8010

COPY my-app/target/myapp-maven.jar myapp-maven.jar 

ENTRYPOINT [ "java", "-jar", "myapp-maven.jar" ]