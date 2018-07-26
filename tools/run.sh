#!/bin/bash

# Give everything meaningful names
NAME_ASTERISK=asterisk-test-1
NAME_FASTAGI=fastagi-test-1

# Do some cleanup.
#echo "Kill all containers"
#docker kill $(docker ps -a -q)
#echo "Removing all containers"
#docker rm $(docker ps -a -q)

# Run the fastagi container.
docker run \
	-p 4573:4573 \
	--name $NAME_FASTAGI \
	-d -t fastagi-test:0.0.1

# Run the main asterisk container.
docker run \
    -v confFiles:/etc/asterisk \
    -p 4574:4574 \
    --name $NAME_ASTERISK \
    --net=host \
    -d -t asterisk-test:0.0.1

# -----------------------------
# Some helpful debug stuff...
# docker run --name $NAME_ASTERISK --net=host -d -t dougbtv/asterisk
# For testing use:
# docker run --name $NAME_ASTERISK --net=host -i -t dougbtv/asterisk bin/bash


#example
# Run the main asterisk container.
'
docker run \
    -v configs:/etc/asterisk \
    -p 4574:4574 \
    --name asterisk-test-N \
    --net=host \
    -d -t asterisk-test:0.0.1
'

#EXEC into docker container

# docker exec -it container-name /bin/bash