FROM ubuntu:latest
RUN apt-get update && \
    apt-get install nginx -y
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

FROM jenkins/jenkins:lts
ENV JENKINS_HOME /var/jenkins_home
expose 8080
expose 8083
