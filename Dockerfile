FROM openjdk:11
EXPOSE 9020
WORKDIR /app
ADD ./my-app/target/myapp-maven.jar myapp-maven.jar
ENTRYPOINT ["java","-jar","myapp-maven.jar"]