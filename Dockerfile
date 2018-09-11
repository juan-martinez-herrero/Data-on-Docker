FROM gudari/java:8u171-b11

ENV MAVEN_VERSION=3.5.4
ENV KYLIN_VERSION=2.4.1
ENV SPARK_VERSION=2.3.0

ENV MAVEN_HOME=/opt/maven
ENV KYLIN_BUILD_DIR=/tmp/kylin

RUN yum update -y && \
    yum install -y wget unzip  && \
    wget http://apache.rediris.es/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    mkdir ${MAVEN_HOME} && \
    tar -xvzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C ${MAVEN_HOME} --strip-components=1 && \
    rm -fr apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    yum clean all -y && \
    rm -rf /var/cache/yum

RUN wget http://apache.rediris.es/kylin/apache-kylin-${KYLIN_VERSION}/apache-kylin-${KYLIN_VERSION}-source-release.zip && \
    mkdir ${KYLIN_BUILD_DIR} && \
    unzip apache-kylin-${KYLIN_VERSION}-source-release.zip -d ${KYLIN_BUILD_DIR}

RUN yum install epel-release -y
RUN yum install git nodejs bzip2 -y

ENV PATH=$PATH:$MAVEN_HOME/bin
WORKDIR $KYLIN_BUILD_DIR/apache-kylin-2.4.1

