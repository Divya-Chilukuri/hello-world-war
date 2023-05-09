FROM openjdk:9
WORKDIR /app
COPY /jenkins/hello-world-war/target/hello-world-war-1.0.0.war /app/hello-world-war-1.0.0.war
EXPOSE 8080 
CMD ["java","-jar","/app/hello-world-war-1.0.0.war"]
