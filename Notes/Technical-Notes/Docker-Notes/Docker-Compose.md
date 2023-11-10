# Docker Compose 

```YAML 
version: '3.8'	# docker-compose version 

# defining services 
services:	
	###################################################################
	# service 1 : frontend 
	###################################################################
	frontend:
	    build: ./frontend 	# we build the image from dockerfile inside dir
		comtainer_name : 	# container name
		ports: 				# define ports 
		  - 3000:3000
		volumes: 			# define volumes for code sync 
		  - ./frontend:/app
	
	# adding test service 
	frontend-test:
		image: project2-vidly-frontend	# we build from the previous image 
		volumes:						# we do not need to sync code
		  - ./frontend:/app		
		command: npm test

	###################################################################
	# service 2 : backend 
	###################################################################
	backend:
		build: ./backend 	# we build the image from dockerfile inside dir
		ports: 				# define ports 
		  - 3001:3001
		environment: 		# define environment vars
		  # Two different ways 
		  # - DB_URL=mongodb://database/vidly
		  DB_URL: mongodb://database/vidly
		volumes:			# define volumes for code  
		  - ./backend:/app
		# overriding command 
		# command is to long and can be replaced by a entrypoint script 
		# command: ./wait-for database:27017 && migrate-mongodb up && npm start
		command: ./docker-entrypoint.sh
		depoends_on :
		  - database
	
	# adding test service 
	backend-test:
		image: project2-vidly-backend
		environment:
		  DB_URL: mongodb://database/vidly
		# define volumes for code (do not need)
		# volumes:
		#   - ./backend:/app
		command: npm test
	
	###################################################################
	# service 3 : database 
	###################################################################
	database:
		image: mongo:4.0-xenial # we build the image 
		ports:					# define ports 
		  - 27017:27017
		volumes:				# define volume for service 
		  - vidly:/data/db

###################################################################

# defining volume globally
volumes:
  vidly:

```

---
`Expose` in a Dockerfile v/s `ports` in Docker-Compose 

- `EXPOSE` command in a Dockerfile : is more of a documentation feature. It indicates that the application inside the container is set to listen on the specified network port(s) at runtime. It doesn't actually expose the port or make it accessible from the host
- `ports` configuration in Docker Compose (or the `-p` flag in the `docker run` command) : actively maps a port from the host machine to a port in the container

---