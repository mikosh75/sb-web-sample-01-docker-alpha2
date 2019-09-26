FROM adoptopenjdk/openjdk11:debian-slim
VOLUME /tmp
ADD target/gs-spring-boot-docker-0.1.0.jar app.jar
COPY keystore3.p12 keystore3.p12
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
