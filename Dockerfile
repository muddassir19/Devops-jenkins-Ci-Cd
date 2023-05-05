# Using tomcat 8 as base image
FROM tomcat:8
# Take the war file and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/dockeransible.war