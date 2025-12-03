FROM juanmartinez/openjdk:11.0.7

LABEL maintainer "Juan Martinez <arcangelo@gmail.com>"
LABEL Description="Gradle build-tools docker image" Version="6.2"

ARG GRADLE_VERSION=6.2
ENV GRADLE_HOME=/opt/gradle

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget unzip \
    && wget https://downloads.gradle-dn.com/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip -d /tmp gradle-${GRADLE_VERSION}-bin.zip \
    && rm -fr gradle-${GRADLE_VERSION}-bin.zip \
    && mv /tmp/gradle-${GRADLE_VERSION} ${GRADLE_HOME} \
    && apt-get remove -y wget unzip \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="${GRADLE_HOME}/bin:${PATH}"

CMD [ "gradle", "-version" ]
