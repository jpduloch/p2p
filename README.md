This repository is a fork of [https://github.com/docker-build/p2p](https://github.com/docker-build/p2p) (GNU General Public License v3.0).

This represents the Server-Part of the Remote Support Control Center (RSCC).
Combined this server and the Client makes up a suite to start a VNC-Connections
between two Clients no if they are located behind NATs or firwalls.

It the clients uses the tunnel over this server to exchange information
needed to establish a direct connection using ICE/STUN and RUDP.
When it is not possilbe to establish a direct connection this Server
is used as relay.

It conatains only small modification to the original repository:
 - Generated token is 9 digits numeric
 - Client Script are updated, the way they are used in RSCC


The DockerPackage is automaticly Build on DockerHub, on every commit.
[DockerHub](https://hub.docker.com/r/jpduloch/p2p/)


* Getting Started

** Installation of a P2P server

   This server should be run as Docker-Container.
   (Other installations are not maintained in this repository)

*** Prerequisites

    Docker Environment has to be installed.

    Follow this guides:
    https://docs.docker.com/engine/installation/

    Or run the following command:
    #+BEGIN_EXAMPLE
    sudo apt-get install docker.io
    #+END_EXAMPLE


    The Server must be reachable over IP or DNS on 2 differest ports

    Recommended is:
        - HTTP: 800
        - ssh: 2201

*** Pulling it from DockerHub

    #+BEGIN_EXAMPLE
    sudo docker search jpduloch/p2p
    sudo docker pull jpduloch/p2p
    sudo docker run -d --name=P2P -p 2201:2201 -p 800:800 jpduloch/p2p
    #+END_EXAMPLE

    For more details about this DockerHub image see:
    https://hub.docker.com/r/jpduloch/p2p/

* Maintaining server

Here a short list of usefull commands

    #+BEGIN_EXAMPLE
### List running container
sudo docker ps

### Create new Container from image:
sudo docker run -d --name=P2P -p 2201:2201 -p 800:800 jpduloch/p2p

### Update Image from Dockerhub
sudo docker pull jpduloch/p2p

### Update Image from Dockerhub with specific tag
sudo docker pull jpduloch/p2p:KeyTo9chars

### Stop Container
sudo docker stop P2P

### Remove Container
sudo docker rm P2P

### Execute bash in container
sudo docker exec -it P2P bash

### if the start of the docker container fails, try to restart the docker-deamon with:
sudo /etc/init.d/docker restart
    #+END_EXAMPLE

* Licensing

    The Project remains under GNU General Public License v3.0
