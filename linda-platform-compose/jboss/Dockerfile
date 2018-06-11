FROM jboss/base:latest
MAINTAINER Tiago Matana <tiago.matana@gmail.com>

# Define JBOSS admin user and password
ENV ADMIN_USER admin
ENV ADMIN_PASSWORD DFQ3JY1lwUxjeLgu

# User root user to install software
USER root

RUN mkdir -p /usr/lib/jvm
RUN mkdir -p /opt/jboss
COPY java-7-oracle.tar.xz/ /java-7-oracle.tar.xz
RUN tar xf /java-7-oracle.tar.xz -C /usr/lib/jvm
COPY jboss-as-7.1.1.tar.xz/ /jboss-as-7.1.1.tar.xz
RUN tar xf /jboss-as-7.1.1.tar.xz -C /opt/jboss
USER jboss

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV JRE_HOME /usr/lib/jvm/java-7-oracle/jre/bin
ENV CLASSPATH /usr/lib/jvm/java-7-oracle/lib

# Expose ports
EXPOSE 8080
EXPOSE 9990
EXPOSE 9999

CMD ["/opt/jboss/jboss-as-7.1.1.Final/bin/standalone.sh", "-b=0.0.0.0", "-bmanagement=0.0.0.0"]
