# syntax=docker/dockerfile:1

FROM openjdk:8u312-jre-buster

LABEL version="3.2.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="SevTech: Ages - 3.2.0"
LABEL homepage.icon="https://media.forgecdn.net/avatars/147/67/636574428512291945.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://SevTechAges:25565
RUN apt-get update && apt-get install -y curl unzip && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]