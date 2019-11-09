# jenkins-docker
Docker image for jenkins with docker support    
##Note-  Chnage the line `docker-ce=17.12.1~ce` depending on ther version of docker client you need to use.

Run:
```
 docker container run -it --name jenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins
 ```
