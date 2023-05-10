FROM openjdk:8
EXPOSE 8080
COPY target/hello-world-war-1.0.0.war hello-world-war-1.0.0.war
 CMD ["java","-jar","hello-world-war-1.0.0.war"]
