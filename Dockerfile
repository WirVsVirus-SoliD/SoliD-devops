# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# set shell to bash
# source: https://stackoverflow.com/a/40944512/3128926
RUN apk update && apk add bash

# Set the working directory to /app
WORKDIR /app

# set environment
ENV app_jar=soliD.backend.jar
ENV download_link=https://github.com/WirVsVirus-SoliD/SoliD-backend/releases/latest/download/${app_jar}

# Copy the fat jar into the container at /app
RUN wget -O app.jar ${download_link}

# Run jar file when the container launches
CMD ["java", "-jar", "app.jar"]
