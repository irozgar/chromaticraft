FROM openjdk:14-jdk-slim-buster AS builder

RUN apt-get update && apt-get install -y git

ARG SPIGOT_VERSION=1.16.1
ARG BUILD_TOOLS_URL=https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

ADD ${BUILD_TOOLS_URL} BuildTools.jar

RUN java -jar BuildTools.jar --rev ${SPIGOT_VERSION}


FROM openjdk:14-slim-buster

WORKDIR /minecraft

COPY --from=builder /spigot-1.16.1.jar spigot.jar
COPY eula.txt server.properties spigot.yml /minecraft/

CMD [ "java", "-Xmx2048M", "-jar", "spigot.jar" ]
