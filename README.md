# Sample Java Web App in Spring Boot framework with Containerization (variant to show SSL)
Readme update 1.0

## Generate self signed certificate
```shell
keytool -genkey -alias alpha2 -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore keystore.p12 -validity 3650
```

## Build with Maven
```shell
mvn package
```

## Run locally (This version include application properties to control server port which is under /src/main/resources/application.properties)
```shell
java -jar target/gs-spring-boot-docker-0.1.0.jar
```

## Test web app locally
```shell
http://localhost
```

## Containerize
1. Build a docker image using `Dockerfile`:
   ```
   docker build -t sb-web-sample-01-docker-alpha2 .
   ```
2. Run docker image locally
   ```
   docker run --rm -p 443:443 sb-web-sample-01-docker-alpha2
   ```
3. Then you can access the web app at http://localhost in browser.

## Deploy to K8S
```shell
kubectl apply -f sb-web-sample-01-docker-kube-alpha2.yaml
```
