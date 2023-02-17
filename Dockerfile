FROM maven:3.8.4-jdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Download the dependencies
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src/ ./src/

# Build the application
RUN mvn package

# Create the final image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/my-maven-project.jar .

# Run the application
CMD ["java", "-jar", "my-maven-project.jar"]




# FROM openjdk:11

# EXPOSE 8010

# COPY my-app/target/myapp-maven.jar myapp-maven.jar 

# ENTRYPOINT [ "java", "-jar", "myapp-maven.jar" ]