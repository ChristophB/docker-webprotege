# docker-webprotege

## Outdated!
There is now an official docker image available at https://hub.docker.com/r/protegeproject/webprotege and https://github.com/protegeproject/webprotege.

---

This image uses tomcat:8.0-jre8.

## Supported tags and respective Dockerfile links
* v3.0.0 , latest ([v3.0.0/Dockerfile](https://github.com/ChristophB/docker-webprotege/blob/v3.0.0/Dockerfile))
* v3.0.0-standalone ([v3.0.0-standalone/Dockerfile](https://github.com/ChristophB/docker-webprotege/blob/v3.0.0-standalone/Dockerfile))
* v2.6.0 ([v2.6.0/Dockerfile](https://github.com/ChristophB/docker-webprotege/blob/master/Dockerfile))
* v2.6.0-standalone ([v2.6.0-standalone/Dockerfile](https://github.com/ChristophB/docker-webprotege/blob/v2.6.0-standalone/Dockerfile))

Standalone images  contain a MongoDB installation.

## Usage:
```sh
docker run -d -p 8080:8080 christophbe/webprotege
```

The startup may take some time. After it has finished you can access WebProtégé at <http://localhost:8080/>. Make sure port 8080 is not used by another service of the host system (otherwise map to a non occupied port). ***Be sure to connect the container to an existing MongoDB instance (see below)!***

***WebProtégé v3.0.0 only:***
1. Run: `docker exec -it [webprotege-container] java -jar /root/webprotege-cli.jar create-admin-account` and set up an admin account.
2. Open <http://localhost:8080/> and use the admin credentials to login.
3. Open <http://localhost:8080/#application/settings> and finish the configuration of WebProtégé.

***Warning: The data storage of v2.6.0 and v3.0.0 are not compatible!*** ([WebProtégé-2.x-Migration](https://github.com/protegeproject/webprotege/wiki/WebProtégé-2.x-Migration)) 

## MongoDB:
There is no MongoDB instance in this image. So you have to link this container to an existing instance.

### Option 1:
Install MongoDB on the host system and add a host entry for 'mongodb' to the WebProtégé container with the parameter `--add-host mongodb:[host-ip]`.

### Option 2:
Start a MongoDB container and link it to the WebProtégé container with the parameter `--link [mongodb-container-name]:mongodb`.

***Example:***
```sh
docker run --name mongodb-container -d mongo
docker run -d -p 8080:8080 --link mongodb-container:mongodb christophbe/webprotege
```

## Data storage:
You can add another container or host folder as volume in `/data/webprotege` to store projects and ontologies outside of the WebProtégé container. e.g.:
```sh
docker run -d -p 8080:8080 -v /host/folder:/data/webprotege christophbe/webprotege
```


---
**WebProtégé reference:**
*Tudorache, Tania, Csongor Nyulas, Natalya F. Noy, and Mark A. Musen. "WebProtégé: A collaborative ontology editor and knowledge acquisition tool for the web." Semantic web 4, no. 1 (2013): 89-99.*
