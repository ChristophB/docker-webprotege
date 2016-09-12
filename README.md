# docker-webprotege

This image uses tomcat:8.0-jre8.

Usage:
```sh
docker run -d -p 8080:8080 christophbe/webprotege
```

The startup may take some time. After it has finished you can access WebProtegé at <http://localhost:8080/>. Make sure port 8080 is not used by another service of the host system (otherwise map to a non occupied port). ***Be sure to connect the container to an existing MongoDB instance (see below)!***

## MongoDB:
There is no MongoDB instance in this image. So you have to link this container to an existing instance.

### Option 1:
Install MongoDB on the host system and add a host entry for 'mongodb' to the WebProtegé container with the parameter `--add-host mongodb:[host-ip]`.

### Option 2:
Start a MongoDB container and link it to the WebProtegé container with the parameter `--link [mongodb-container-name]:mongodb`.

***Example:***```sh
docker run --name mongodb-container -d mongo
docker run -d -p 8080:8080 --link mongodb-container:mongodb christophbe/webprotege
```

## Data storage:
You can add another container or host folder as volume in `/data/webprotege` to store projects and ontologies outside of the WebProtegé container. e.g.:
```sh
docker run -d -p 8080:8080 -v /host/folder:/data/webprotege christophbe/webprotege
```


---
**WebProtegé reference:**
*Tudorache, Tania, Csongor Nyulas, Natalya F. Noy, and Mark A. Musen. "WebProtégé: A collaborative ontology editor and knowledge acquisition tool for the web." Semantic web 4, no. 1 (2013): 89-99.*
