FROM ubuntu:15.04

MAINTAINER Markus Hjort <markus.hjort@gmail.com>

RUN apt-get update

RUN apt-get install -y git openjdk-7-jre-headless tar curl

RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

#RUN git config --global --unset core.autocrlf

RUN java -jar BuildTools.jar

ADD start.sh start.sh

RUN chmod u+x start.sh

RUN ./start.sh

ADD eula.txt eula.txt

ADD server.properties server.properties

ADD world world

ADD world_nether world_nether

ADD Lobby.jar plugins/Lobby.jar

ADD MinigamesParty.jar plugins/MinigamesParty.jar

ADD Project_HungerGames.jar plugins/Project_HungerGames.jar

ADD ops.json ops.json

EXPOSE 25565

CMD ["sh", "start.sh"]
