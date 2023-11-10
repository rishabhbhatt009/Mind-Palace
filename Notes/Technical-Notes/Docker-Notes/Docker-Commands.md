
```bash 
docker version 								# check version 

##################################################################################
# WORKING WITH IMAGES
# Flags (a:all, q:quiet, t:tag, it:interactive)
##################################################################################
docker image ls -a 							# list docker images
docker image rm/remove id/name:tag			# remove image/s or tag/s
docker image remove $(docker image ls -aq) 	# combining commands
docker image prune 							# remove dangling images

docker build -t image:tag .		 			# build image from docker file in CWD 
docker run -it image sh						# run image with command sh (shell)

docker image tag app:tag app:new-tag		# add/change tag
docker history react-app					# see the layers

# saving and sharing images
docker push image-name:tag					# push image to dockerhub 
docker image save -o name.tar image-name	# save image locally 
docker image load -i name.tar				# load image 

##################################################################################
# WORKING WITH CONTAINERS
# Flags (a:all, d:detach, it:interactive, f:force/follow, u:user)
##################################################################################
docker ps -a 								# list containers (processes)
docker container ls -a 						# list containers

docker run image-name						# start new container (same as run image)
docker run -d image-name					# start detached (background) container
docker run -d --name name image-name cmd	# give container name 

docker run -d -p PORT_ON_HOST:PORT_ON_CONTAINER image-name # publishing ports 

docker start CONTAINER_ID_OR_NAME			# start container (existing container)
docker stop CONTAINER_ID_OR_NAME			# stop container

docker logs -f CONTAINER_ID_OR_NAME			# check logs (follow)

docker exec -it CONTAINER_ID_OR_NAME sh		# exec command in running container
docker exec -it -u root CONTAINER sh		# shel as root user

docker container prune 						# remove all stoped containers
docker container rm CONTAINER_ID_OR_NAME	# remove container
docker rm -f CONTAINER_ID_OR_NAME			# remove container (force flag)

##################################################################################
# WORKING WITH VOLUMES
# volume is persistent and can be shared with host/other containers
# docker run volume :
# - flag = -v volume : path_in_container
# - new volume or path will get created if it doesn't exist
# Note : 
# - if docker creates the path_in_container, user might not have access
# - solution : create path in docker file
##################################################################################
docker volume ls							# list all volumes
docker volume rm/remove						# remove volumes 
docker volume prune							# remove all unused volumes
docker volume create app-data				# create volume 
docker volume inspect app-data				# inspect

docker run -v app-data:/app/data image-name	# start container with volume 

##################################################################################
# Copying files between the host and containers
##################################################################################
docker cp CONTAINER_ID_OR_NAME:/app/log.txt . 	# copy file container -> host(cwd)
docker cp secret.txt CONTAINER_ID_OR_NAME:/app	# copy file host -> container(/app)

##################################################################################
# Sharing source code with containers
# - Flags (p:port)
##################################################################################
docker run -p host:container -v path/on/host:/path/on/container image-name	
docker run -p host:container -v $(pwd):/path/on/container image-name	

```

---

```bash
##################################################################################
# DOCKER-COMPOSE
# Flags (d:detach, )
##################################################################################

docker-compose build						# build images 
docker-compose build --no-cache				# build images with no cache

docker-compose up							# start containers 
docker-compose up --build -d				# combines build and up 
docker-compose down							# stop and remove containers 				

docker network ls 							# list networks 

docker-compose ps							# containers for current application 
docker ps 									# all containers 
docker-compose logs							# logs from all containers (color coded)

docker-compose updocker-compose up -d		

```

---