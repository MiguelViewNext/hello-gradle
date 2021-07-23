# Build stage
FROM openjdk:11 AS base
WORKDIR /opt/hello-gradle
COPY ./ ./
RUN ./gradlew assemble \
  && rm -rf /root/.gradle
#CMD java -jar build/libs/demo-0.0.1-SNAPSHOT.jar

# Runtime stage
FROM openjdk:11
WORKDIR /opt/hello-gradle
COPY --from=base /opt/hello-gradle/build/libs/demo-0.0.1-SNAPSHOT.jar ./
CMD java -jar demo-0.0.1-SNAPSHOT.jar
