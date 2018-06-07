FROM ubuntu:16.04

MAINTAINER Ho Quoc Toan <hqtoan94@gmail.com>

WORKDIR /usr/src/app

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y python-software-properties software-properties-common

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  add-apt-repository -y ppa:jonathonf/python-3.6 && \
  apt-get update && \
  apt-get install -y oracle-java8-installer python3.6 && \
  apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py ./