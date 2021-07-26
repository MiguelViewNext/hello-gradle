# Build stage
FROM openjdk:11 AS base
WORKDIR /opt/hello-gradle
COPY ./ ./
RUN ./gradlew assemble \
  && rm -rf /root/.gradle
#CMD java -jar build/libs/demo-0.0.1-SNAPSHOT.jar

# Runtime stage
# FROM adoptopenjdk:11-jre-hotspot
#FROM openjdk:11.0.12-jre-slim-buster
FROM openjdk:11.0-jre-slim
WORKDIR /opt/hello-gradle
COPY --from=base /opt/hello-gradle/build/libs/demo-0.0.1-SNAPSHOT.jar ./
CMD java -jar demo-0.0.1-SNAPSHOT.jar
