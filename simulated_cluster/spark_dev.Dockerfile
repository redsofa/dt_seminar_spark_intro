FROM redsofauid/spark-base

ENV USER ds

# -- Layer: Build tools (MVN/Scala/R)

USER root

WORKDIR /tmp

RUN curl https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz -o mvn.tar.gz && \
    tar -xvzf mvn.tar.gz && \
    curl https://downloads.lightbend.com/scala/2.12.15/scala-2.12.15.tgz -o scala-2.12.15.tgz && \
    tar -xvzf scala-2.12.15.tgz && \
    mv apache-maven-3.8.4 /usr/bin/ && \
    mv scala-2.12.15 /usr/bin/ && \
    rm -f /tmp/scala-2.12.15.tgz && \
    rm -f /tmp/mvn.tar.gz && \
    apt-get install -y  dirmngr gnupg apt-transport-https ca-certificates software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran41/' && \
    apt-get install -y r-base


ENV PATH "$PATH:/usr/bin/scala-2.12.15/bin:/usr/bin/apache-maven-3.8.4/bin"


# -- Runtime
USER $USER
WORKDIR /src