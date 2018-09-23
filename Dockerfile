FROM ubuntu:16.04
MAINTAINER luojimeng <luojimeng@advanpro.hk>

# RUN mv /etc/apt/sources.list /etc/apt/sources.list.org
# COPY addfiles/etc/apt/sources.list /etc/apt/sources.list

RUN mkdir -p /root/.ssh && \
    mkdir -p /opt/conf.d

COPY addfiles/root/.ssh/id_rsa /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/id_rsa

RUN apt-get update && apt-get -y upgrade

# install jdk
RUN apt-get update && \
    apt-get install -y software-properties-common netcat-traditional && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y unzip curl oracle-java8-installer && \
    curl -v -j -k -L -H "Cookie:oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip  > /usr/src/jce_policy-8.zip && \
    unzip /usr/src/jce_policy-8.zip -d /usr/src && cp /usr/src/UnlimitedJCEPolicyJDK8/* /usr/lib/jvm/java-8-oracle/jre/lib/security/


ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle


