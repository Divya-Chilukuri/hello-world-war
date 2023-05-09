FROM maven:latest AS stage1
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean install

FROM openjdk:9
COPY --from=stage1 /usr/src/app/target/hello-world-war-1.0.0.war /usr/app/hello-world-war-1.0.0.war
ENTRYPOINT ["java","-jar","/usr/app/hello-world-war-1.0.0.war"]
