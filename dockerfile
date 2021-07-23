FROM openjdk:11
WORKDIR /opt/hello-gradle
COPY ./ ./
RUN ./gradlew assemble \
  && rm -rf /root/.gradle
CMD java -jar build/libs/demo-0.0.1-SNAPSHOT.jar
