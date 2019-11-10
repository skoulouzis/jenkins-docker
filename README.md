# jenkins-docker

## Build and Configure
To build:
```
docker build -t jenkins .
```

To run:
```
 docker container run -it --name jenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins
 ```
 To have a percistant container add a volume for the home directory:
 ```
  docker container run -it --name jenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home jenkins
 ```
 
 
