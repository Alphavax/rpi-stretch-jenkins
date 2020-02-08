FROM jsurf/rpi-raspbian:stretch

# Jenkins version
ENV JENKINS_VERSION 2.204.2

# Other env variables
ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

# Install dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends curl openjdk-8-jdk \
  && rm -rf /var/lib/apt/lists/*

# Get Jenkins
RUN curl -fL -o /opt/jenkins.war http://mirrors.jenkins.io/war-stable/{$JENKINS_VERSION}/jenkins.war

# Expose volume
VOLUME ${JENKINS_HOME}

# Working dir
WORKDIR ${JENKINS_HOME}

# Expose ports
EXPOSE 8080 ${JENKINS_SLAVE_AGENT_PORT}

# Start Jenkins
CMD ["sh", "-c", "java -jar /opt/jenkins.war"]
