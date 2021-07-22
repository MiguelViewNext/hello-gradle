FROM gradle:7.1.1-jdk11
RUN mkdir /home/hello-gradle
COPY ./ /home/hello-gradle
WORKDIR /home/hello-gradle
CMD ["./gradlew", "bootRun"]
