#Stage 1
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

COPY --chmod=0755 gradlew gradlew
COPY gradle gradle
COPY build.gradle build.gradle
COPY settings.gradle settings.gradle

RUN --mount=type=cache,target=/root/.gradle ./gradlew dependencies --write-locks

COPY src src

RUN --mount=type=cache,target=/root/.gradle ./gradlew build

#Stage 2
FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /app/build/libs/*.jar petclinic.jar

#ENV SPRING_PROFILES_ACTIVE=postgres

EXPOSE 8081


#test4
CMD [ "java","-jar","petclinic.jar" ]