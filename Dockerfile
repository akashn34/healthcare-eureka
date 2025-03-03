# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/eureka-server-0.0.1-SNAPSHOT.jar app.jar

# Expose the Eureka port
EXPOSE 8761

# Command to run the Eureka server
ENTRYPOINT ["java", "-jar", "app.jar"]

