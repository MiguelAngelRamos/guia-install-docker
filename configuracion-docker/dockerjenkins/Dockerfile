FROM jenkins/jenkins
USER root

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg

RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

# Agregar Maven
RUN rm -rf /opt/maven && \
    curl -O https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz && \
    tar xzvf apache-maven-3.9.3-bin.tar.gz && \
    mv apache-maven-3.9.3 /opt/maven
ENV M2_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}

RUN usermod -aG docker jenkins

RUN echo '{\
  "log-driver": "json-file",\
  "log-opts": {\
    "max-size": "10m",\
    "max-file": "3" \
  }\
}' > /etc/docker/daemon.json

USER jenkins