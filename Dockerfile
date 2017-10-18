FROM centos
MAINTAINER Simplicite.io <contact@simplicite.io>
RUN yum upgrade -y && yum clean all
RUN yum -y install java-1.8.0-openjdk-devel mariadb postgresql && yum clean all
COPY tomcat /usr/local/tomcat
RUN sed -i '/${tomcat.ajpport}/s/<!-- /</;/${tomcat.ajpport}/s/ -->/>/' /usr/local/tomcat/conf/server.xml
RUN chmod +x /usr/local/tomcat/bin/*.sh /usr/local/tomcat/run.sh
EXPOSE 8005 8080 8443 8009
CMD cd /usr/local/tomcat; ./run.sh -t
