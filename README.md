# rpi-stretch-jenkins
Jenkins for Raspbian Stretch


https://hub.docker.com/repository/docker/alphavax/rpi-stretch-jenkins

Run Jenkins from Raspberry Pi (Raspbian OS Stretch)

Create a jenkins directory in order to keep Plugins and settings, i.e. /home/{user}/jenkins

docker pull alphavax/rpi-stretch-jenkins:jdk8-lts

docker run --name="jenkins_jdk8" -p 80:8080 -p 50000:50000 --hostname="{hostname}" -v /home/{user}/jenkins:/var/jenkins_home -v /home/{user}/jenkins/.ssh:/root/.ssh --restart unless-stopped --detach=true alphavax/rpi-stretch-jenkins:jdk8-lts
