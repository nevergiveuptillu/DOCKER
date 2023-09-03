- Story of an organization and Problem introduction
- Application Deployments
    Terms
•	Capex: Captial Expenditure
•	Opex: Operational Expenditure
•	Physical Server
•	Hypervisor
•	Virtual Machine
•	Return on Investment (ROI)

-Evolution 
 •	Generation 1: Directly run on Physical Servers
 •	Generation 2: Hypervisors create virtual machines and applications installed in virtual machines
 •	Generation 3: Containers: These are isolated areas which look like vms but the container is an isolated area which has virtualized os.

 What is docker?
 Expectations from you in terms of Docker
•	Containerize any application run by your organization.
•	Manage Data, Security and Networks for containerized applications.
•	To archive the above expectations, we need to use
•	docker and understand how it runs and creates containers
•	play with docker around networks, data and security
•	apply them to our application.

Docker Installation

•	docker client:
•	docker engine: This is collection of multiple components
•	Orchestration
•	Docker daemon
•	Runtime

terms To be aware of
•	containerd
•	runc
•	libcontainer
•	oci
•	docker shim
•	appc
•	grpc
•	rkt containers

Let me take a application
•	This is spring pet clinic application
•	Lets try to run this application on linux
•	Refer Here
•	To build the code
sudo apt update
sudo apt install openjdk-17-jdk maven -y
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
# java package
mvn package
java -jar target/spring-petclinic-3.0.0-SNAPSHOT.jar

•	Dockerfile
•	Dockerfile
FROM amazoncorretto:17-alpine-jdk
LABEL author=khaja
ADD target/spring-petclinic-3.0.0-SNAPSHOT.jar /springpetclinic.jar
EXPOSE 8080
CMD ["java", "-jar", "/springpetclinic.jar"]
•	Create docker image
docker image build -t spc:1.0 .
•	to create container
docker container run -d -P spc:1.0
docker container run -d -P spc:1.0
docker container run -d -P spc:1.0

How Isolations are created or How Containers Work

•	Each container is getting a
•	new process tree
•	disk mounts
•	network (nic)
•	cpu/memory
•	users
•  for Docker Internals

Docker Architecture:

Generation 1:
•	This was first gen, Where docker daemon used lxc (a linux kernel feature) to create containers
 
Generation2:
•	Since docker was relying on lxc which was kernel feature, updates to kernel frequently used to break containers created by docker.
•	So docker has created its own component called libcontainer (libc) to create containers.
•	Docker wanted containers to be multi os and lxc was definetly not the way forward.
 
•	Adoption of docker was drastically increased as it was stable.
Generation 3:
•	In this generation, docker engine was revamped from monolith to multi component architecture and the images and containers were according to OCI (open container initiative) image spec and runtime spec.
•	In the latest architecture
•	docker daemon exposes api’s to listen requests from docker client.
•	Passes the requests to containerd. This manages the lifecylcle of container
•	containerd forks a runc process which creates container. once the container is created the parent of the container 
•	containerd forks a runc process which creates container. once the container is created the parent of the container will be docker shim
 
Creating our first docker container

Playing with containers
Check docker images in the host
pull the images from docker hub

Remove images from local
Docker container lifecycle
•	Docker lifecycle states
•	Created
•	Running
•	Paused
•	Stopped
•	Deleted

Containerizing spring petclinic
Dockerfile based Image building

•	Workflow
•	Dockerfile is a text file with instructions Refer Here

Basic Instructions
home
/
Reference
/
Dockerfile reference
/
instructions

Springpetclinic Dockerfile

Immutable Infrastructure

Dockerfile Instructions Contd…

What do we mean by running container in detached mode?

.net application manual process

Fixing issue with startup of .net application

Setting Environment Variables in the container

•	Refer Here for the changes done to add a non root user to run the nop commerce application.
 
 Image Layers

Layers in Docker Image

Container and layers
Stateful Appplications and Stateless Applications
•	Stateful applications use local storage to store any state
•	Stateless applications use external systems (database, blobstorage etc) to store the state

Solving the Problem with Writable Layers


Docker Volumes

KeyPoints
1.	Always ensure volumes are automatically created for the stateful applications as part of Dockerfile (VOLUME instruction)
2.	Volumes are of two types
1.	Explicity created (docker volume create myvol)
2.	automatically created as part of container creation
3.	Ensure we have knowledge on necessary folders where the data is stored and use volumes for it


Persisting Data using Volumes

Creating volume as part of Dockerfile

Shell file to clean everything

```#!/bin/bash
docker container rm -f $(docker container ls -a -q)
docker volume prune
docker image rm -f $(docker image ls -q)
```
Entrypoint and CMD

FROM alpine
ENTRYPOINT ["sleep"]
CMD ["1d"]


Docker Networks

•	Docker has multiple network driver implementations
•	bridge
•	host
•	macvlan
•	overlay
•	Bridge:
•	Default bridge will not have dns enabled (this is why in the above experiment C1 was not able to ping C2 by name)


Multi Stage Docker build

<!-- Exercise -->

1.	Install docker on a linux vm
2.	Run 1 httpd containers (apache container) which runs on 80 port
3.	try accessing any application
4.	stop the containers
5.	try accessing
6.	start the continers and access this should work
7.	pause the containers, access the application
8.	unpause the containers, access the application
9.	delete the containe
•	Create a ubuntu vm
•	install apache2 and note the ExecStart command for apache2
•	install tomcat9 and note the ExecStart command for tomcat9
•	stop the services (systemcl stop servicename)
•	become a root user (sudo -i)
•	try executing the ExecStart command directly and see if the application is running
•	Gameof life application:
•	This requires java 8
•	this requires tomcat 8 or 9
•	copy the gameoflife.war application into webapps folder of tomcat Refer Here
•	This runs on port 8080
•	Create a mysql container
•	create a postgresql container
•	list all the volumes
•	inspect all the volumes
•	create volume docker volume create myvol
•	inspect myvol
•	Figure out locations of volumes in your local systems
•	Create a alpine container with the following names
docker container run -d --name C1 alpine sleep 1d
docker container run -d --name C2 alpine sleep 1d
•	Now run in C1 ping C2 (docker container exec C1 ping C2)
•	Findout ip addresses of C1 container and C2 container by executing
docker container inspect C1 172.17.0.2
docker container inspect C2 172.17.0.3
•	Now login into C1 and ping C2 by using its ipaddress
•	Observation Results
•	ping by name is not working
•	ping by ip is working




