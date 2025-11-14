#FROM containers.intersystems.com/intersystems/iris:2022.3.0.606.0
FROM intersystemsdc/iris-community

USER root

RUN apt-get update ; exit 0
RUN apt-get install -y git && git config --global http.sslverify false

#On crée un dossier où stocker les BDD. Les BDD auront un volume dédié.
RUN mkdir /databases
RUN chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_MGRUSER} /databases

#On crée le dossier pour mettre le code
RUN mkdir /opt/iriscode 
WORKDIR /opt/iriscode
RUN chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_MGRUSER} /opt/iriscode
RUN chmod -R 777 /opt/iriscode

#On crée le dossier où seront les éléments à importer
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp

USER ${ISC_PACKAGE_MGRUSER}

RUN git config --global http.sslverify false

COPY ./*/Config/* .
COPY ./DOCKER/Install/zpm* ./zpm.xml
COPY ./DOCKER/Install/Script* .
COPY ./DOCKER/Install/iris.key /usr/irissys/mgr/iris.key


COPY ./DOCKER/Install/iris.script /tmp/iris.script

# run iris and script
RUN iris start IRIS \
	&& iris session IRIS -U %SYS < /tmp/iris.script \
    && iris stop IRIS quietly

# bringing the standard shell back
SHELL ["/bin/bash", "-c"]
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]