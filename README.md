# jenkins-docker

## Build
To build:
```
docker build -t jenkins .
```
## Run

To run:
```
 docker container run -it --name jenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins
 ```
 To have a percistant container add a volume for the home directory:
 ```
  docker container run -it --name jenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home jenkins
 ```
 
 ## Configure

### First boot
You should get the password  for the first login in the terminal

<img src="/images/start-docker.png" alt="password"
	title="Get the first login password." width="550"/>
 
 
 Open http://localhost:8080 you should paste the password you copied into 'Administrator password'
<img src="/images/first-login.png" alt="first-login"
	title="Paste the password you copied into 'Administrator password'." width="550"/>

Install the suggested plugins:

<img src="/images/install-suggested-plugins.png" alt="install-suggested-plugins"
	title="Paste the password you copied into 'Install the suggested plugins'." width="550"/>
	

Create the first admin user:

<img src="/images/first-dmin-user.png" alt="first-dmin-user"
	title="Create the first admin user " width="550"/>

### Add openjdk and Maven

Go to 'Manage Jenkins' > ''Global Tool Configuration' 
<img src="/images/manage_jenkins1.png" alt="Manage Jenkins"
	title="Manage Jenkins " width="550"/>
 	

<img src="/images/manage_jenkins2.png" alt="Manage Jenkins"
	title="Manage Jenkins " width="550"/>	

In 'JDK' slect 'Add JDK', unselect 'Install automatically' and enter in 'Name' : 'openjdk-11' in 'JAVA_HOME' : '/usr/lib/jvm/java-11-openjdk-amd64/' and press 'Apply'
<img src="/images/manage_jenkins3.png" alt="Manage Jenkins"
	title="Manage Jenkins " width="550"/>	


Scroll down and go to the Maven section  and enter in 'Name' : 'maven-3.6.2', select 'Install from Apache'  select 'Version' : '3.6.2'. Finally press 'Apply'

<img src="/images/add_maven.png" alt="add_maven"
	title="add_maven" width="550"/>	
 
 ### Set Master 'docker' label
 To be able to run tasks with nodes labaled 'docker' we'll add it to the master
 
 Go to 'Manage Jenkins' > ''Global Tool Configuration' 
<img src="/images/manage_jenkins1.png" alt="Manage Jenkins"
	title="Manage Jenkins " width="550"/>
	
 Select 'Manage Nodes'
 /jvm/java-11-openjdk-amd64/' and press 'Apply'
<img src="/images/tag_master0.png" alt="Tag Master"
	title="Tag Master" width="550"/>	
	
 Select the master
<img src="/images/tag_master1.png" alt="Tag Master"
	title="Tag Master" width="550"/>
	
 Select 'Configure'
 /jvm/java-11-openjdk-amd64/' and press 'Apply'
<img src="/images/tag_master2.png" alt="Tag Master"
	title="Tag Master" width="550"/>	
	
 In the 'Lables' add docker and press 'Save'
 /jvm/java-11-openjdk-amd64/' and press 'Apply'
<img src="/images/tag_master3.png" alt="Tag Master"
	title="Tag Master" width="550"/>	
 
 
