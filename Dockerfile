FROM tomcat:8.0-jre8
MAINTAINER Christoph Beger

# Deployment
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf *
RUN mkdir -p /data/webprotege
RUN wget -q --no-check-certificate -O webprotege.war https://github.com/protegeproject/webprotege/releases/download/v2.6.0/webprotege-2.6.0.war
RUN unzip -q webprotege.war -d ROOT && rm webprotege.war

# Add properties file to webprotege webapps folder
RUN touch ROOT/webprotege.properties
RUN echo \
  webprotege.data.directory=/data/webprotege"\n" \
  webprotege.application.host=localhost"\n" \
  > ROOT/webprotege.properties
RUN echo "\n"mongodb.host=mongodb"\n" >> ROOT/WEB-INF/classes/webprotege.properties

EXPOSE 8080

CMD catalina.sh run