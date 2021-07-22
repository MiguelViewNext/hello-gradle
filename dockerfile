FROM openjdk:11
RUN mkdir /home/hello-gradle
WORKDIR /home/hello-gradle
COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar ./
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
