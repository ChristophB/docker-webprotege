# docker-webprotege

This image uses tomcat:8.0-jre8.

Usage:
```sh
docker run -d -p 8080:8080 christophbe/webprotege
```

The startup may take some time. After it has finished you can access WebProtegè at http://localhost:8080/ .
Make sure port 8080 is not used by another service of the host system (otherwise map to a non occupied port).
