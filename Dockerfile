FROM tomcat:8.0-jre8
MAINTAINER Christoph Beger

RUN apt-get -qq update && apt-get -qq install -y mongodb git maven openjdk-8-jdk

WORKDIR /usr/local/tomcat/webapps

RUN rm -rf *
RUN mkdir -p /srv/webprotege /etc/webprotege /var/log/webprotege
RUN wget -q --no-check-certificate -O ROOT.war https://github.com/protegeproject/webprotege/releases/download/v3.0.0/webprotege-3.0.0.war
RUN wget -q --no-check-certificate -O /root/webprotege-cli.jar https://github.com/protegeproject/webprotege/releases/download/v3.0.0/webprotege-3.0.0-cli.jar

COPY *.properties /etc/webprotege/

EXPOSE 8080

CMD sh /etc/init.d/mongodb start && catalina.sh run
