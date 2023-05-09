FROM openjdk:9
WORKDIR /app
COPY /target/hello-world-war-1.0.0.war /app/hello-world-war-1.0.0.war
EXPOSE 8080 
ENTRYPOINT ["java","-jar","/app/hello-world-war-1.0.0.war"]
