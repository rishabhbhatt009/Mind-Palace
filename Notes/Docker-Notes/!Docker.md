# Docker

[Linux-Command-Line](Notes/Docker-Notes/Linux-Command-Line.md) | [Dockerfile](Notes/Docker-Notes/Dockerfile.md) | [Docker-Commands](Notes/Docker-Notes/Docker-Commands.md) | docker-compose 

---
Introduction to Docker :

- Virtual Machine v/s Container 
- Hypervisor v/s Docker Engine (Daemon) 
- Docker Architecture : Client - Server Architecture 
- Docker File -> Docker Image -> Docker Container 
- Container Registry : [DockerHub](https://hub.docker.com/) 

---
Building Images :

- **Docker File** 
- **Docker Image** : base Image, copying files and dir (`dockerignore`), running commands, setting env variables, **exposing ports**, setting users, defining entry point
- Optimizing Builds : 
	- concept of layers, docker caches layers, 
	- docker file should go from stable instructions -> changing instructions 
- Operations with images : Removing, Tagging, Sharing, Saving & Loading

---
Working with Containers 

- **Docker Containers** : starting new containers, viewing logs, **publishing ports**,  executing commands, start & stop existing container, removing containers
- Container file system (not persistent, gets deleted with the container)
- Persisting data using **Volumes**
- Sharing file b/w host <-> container, sharing source code host <-> container

---
Running Multi-container Applications

- **Docker Compose**
- Docker Networking
- Database migration : MongoDB, [MongoDB Compass](https://www.mongodb.com/products/compass), migrate-mongo, Docker **wait-for** script
- Automated Testing : adding test service 

---
Deploying Applications 

- Deployment options : 
	- Single host deployment, 
	- Cluster Deployment (we need ==Orchestration Tools : Docker Swarm, Kubernetes==)
- **Virtual Private Server (VPS)** : Providers (Digital Ocean, GCP, Azure, AWS)
- **Docker Machine** 
- Optimized Production Image
- Deploying



---