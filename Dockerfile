FROM openjdk:17
COPY build/libs/calculatric-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
