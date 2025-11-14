FROM environnement-framework

USER root


WORKDIR /opt/irisapp

USER ${ISC_PACKAGE_MGRUSER}


COPY */Config/* .
COPY . ./code


COPY DOCKER/Deploy/iris_deploy.script /tmp/iris_deploy.script

# run iris and script
RUN iris start IRIS \
	&& iris session IRIS -U %SYS < /tmp/iris_deploy.script \
    && iris stop IRIS quietly

# bringing the standard shell back
SHELL ["/bin/bash", "-c"]
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]