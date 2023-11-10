Docker File

```bash
FROM base-image 			# specify the base image

##################################################################################
# Setting user :
# - default = root user, not secure as it has permission to write files 
# - we create a new user 
# - best practice : create "user" and add it to a group "user"
# - all following commands will be executed using set user'
#
# RUN : 
# - execute commands during the image build process (build-time instruction)
# - typically used to install software, update packages, download files, and set  
# 	up dependencies that your application requires
##################################################################################
RUN addgroup username && adduser -S -G username username 	# create user & group
USER username 												# set user 
##################################################################################

WORKDIR /the/workdir/path 	# specify working dir

##################################################################################
# COPY files (context) from project dir to container (WORKDIR)
# COPY v/s ADD : COPY = STD & more clear (unless you need additional features)
# ADD has 2 features
# - add files from URL 
# - uncompress .zip files 
# .dockerignore : to exclude files / folders
##################################################################################
COPY . . 					# copy all files 
COPY ["script", "/app"] 	# when file name has space
# ADD 						# add files
##################################################################################

RUN command 				# run commands
ENV var_name=var_val 		# set environment variables

##################################################################################
# Expose command doesnt actually publish the port, just a form of doc which tells
# that this container will eventually listen on port 8000
##################################################################################
EXPOSE 3000 				# expose port 
##################################################################################


##################################################################################
# CMD : 
# - set the default command 
# - executed when a container based on the image starts running (run-time inst.)
# - only one CMD instruction should be present in a dockerfile
# - can override while running image (docker run app instruction)
#
# ENTRYPOINT : 
# - harder to override (have to specify flag) 
# - instruction will not be overridden by the provided command. Instead, the  
# 	additional arguments will be appended to the command specified in ENTRYPOINT
#
# Both can be combined [*]
# - If both are specified, the command specified in `CMD` will be used as 
# 	arguments for the command specified in `ENTRYPOINT`
##################################################################################
CMD npm start				# default instruction : shell form
CMD ["npm", "start"]		# exec form (faster, cleaner, no shell required)

ENTRYPOINT ["npm", "start"]	# default instruction

# compbined 
ENTRYPOINT ["echo"] 
CMD ["Hello, World!"]
##################################################################################

```

---