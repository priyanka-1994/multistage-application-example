# Dockerfile for Multi-stage

FROM openjdk:8 as builder
RUN mkdir -p /app
COPY . /app
WORKDIR /app
RUN ./mvnw clean package

FROM openjdk:8
COPY --from=builder /app/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]


# Saving and loading images
# docker save multi-stage-application > multi-stage-application.tar

# docker load --input multi-stage-application.tar
