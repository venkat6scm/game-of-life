FROM tomcat
MAINTAINER mani
RUN mv webapps webapps2 && mv webapps.dist/ webapps
COPY target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
CMD ["catalina.sh","run"]
