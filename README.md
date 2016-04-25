# Jenkins 2 with docker inside

Designed to run docker inside a Jenkins docker. It will use the `docker.sock`. It won't run a docker daemon inside a docker.

# Start itup

With a docker file

```
jenkins:
  image: sdelrio/jenkinsci-docker
  ports: 
    - "8080:8080"
    - "50000:50000"
  environment:
    - JAVA_OPTS=-Xmx4196m -Xms4196m -XX:+UseG1GC -Dhudson.footerURL="http://my.domain.com"
    - TZ=Europe/Madrid
  volumes: 
    - /srv/data-jenkins:/var/jenkins_home 
    - /var/run/docker.sock:/var/run/docker.sock
  restart: always
```

# Build

Use `make build`, or manually:

```
docker build --rm -t sdelrio/jenkinsci-docker .
```

# Customize it

- `ENV DOCKER_VERSION 1.11.0`: Version of the docker to include inside the jenkins docker
- `ENV DOCKER_GID`: GID number for docker group

