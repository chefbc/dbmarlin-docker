FROM centos:latest

ENV DB_MARLIN_VERSION dbmarlin-Linux-x64-1.11.0

RUN dnf update -y && dnf install -y \
  curl \
  net-tools \
  which && \
  dnf clean all

RUN groupadd dbmarlin \
  && useradd --gid dbmarlin --shell /bin/bash --create-home dbmarlin

COPY ./software/${DB_MARLIN_VERSION}.tar.gz /opt/${DB_MARLIN_VERSION}.tar.gz

WORKDIR /opt/

# tar -xzvf dbmarlin-Linux-x64-latest.tar.gz
RUN gunzip ${DB_MARLIN_VERSION}.tar.gz \
  && tar xf ${DB_MARLIN_VERSION}.tar

RUN chown -R dbmarlin:dbmarlin /opt 

WORKDIR /opt/dbmarlin

USER dbmarlin

CMD ./configure.sh -a -n9090 -t9080 -p9070 -sXSmall -u ; ./start
EXPOSE 9090


