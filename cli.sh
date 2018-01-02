#!/usr/bin/env bash
JENKINS_URL=http://127.0.0.1:8080
if [ -z ${JCLIUSER}] || [ -z ${JCLIPASS}]; then
	JCLIUSER=admin
	JCLIPASS=`cat ${JENKINS_HOME}/secrets/initialAdminPassword`
fi

JENKINS_CLI_JAR="/usr/share/jenkins/jenkins-cli.jar"
if [[ ! -f ${JENKINS_CLI_JAR} ]]; then
	curl -o ${JENKINS_CLI_JAR} ${JENKINS_URL}/jnlpJars/jenkins-cli.jar
fi

JENKINS_CLI="java -jar ${JENKINS_CLI_JAR} -s ${JENKINS_URL} "
JENKINS_OPTS=" --username $JCLIUSER --password $JCLIPASS"
echo "${JENKINS_CLI} $* ${JENKINS_OPTS}"
${JENKINS_CLI} $* ${JENKINS_OPTS}
