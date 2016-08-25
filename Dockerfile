# docker run -d -p 8080:8080 christophbe/webprotege

FROM tomcat:8.0-jre8
MAINTAINER Christoph Beger

# MongoDB
RUN apt-get -qq update && apt-get -qq install -y mongodb

# Deployment
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf *
RUN mkdir -p /data/webprotege
RUN wget -q --no-check-certificate -O webprotege.war https://github.com/protegeproject/webprotege/releases/download/v2.6.0/webprotege-2.6.0.war
RUN unzip -q webprotege.war -d ROOT && rm webprotege.war

# Add properties file to webprotege webapps folder
RUN touch ROOT/webprotege.properties
RUN echo 'webprotege.data.directory=/data/webprotege' > ROOT/webprotege.properties
RUN echo 'webprotege.application.host=localhost' >> ROOT/webprotege.properties

EXPOSE 8080

CMD sh /etc/init.d/mongodb start && catalina.sh run