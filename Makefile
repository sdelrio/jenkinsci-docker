build:
	docker build --rm -t sdelrio/jenkinsci-docker .

run: kill
	docker run -d --name jenkinsci-docker -p 8080:8080 -p 50000:50000 -e TZ=Europe/Madrid -e JAVA_OPTS="-Xmx4196m -Xms4196m -XX:+UseG1GC"  -v /var/run/docker.sock:/var/run/docker.sock sdelrio/jenkinsci-docker

kill:
	-docker kill jenkinsci-docker
	-docker rm jenkinsci-docker
