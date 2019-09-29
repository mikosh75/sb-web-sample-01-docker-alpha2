#!/bin/bash

##
# Set command search path
##
PATH=/bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin:/usr/libexec:/System/Library/CoreServices; export PATH

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
  else
    BUILD="$1"
    "/opt/apache-maven-3.6.1/bin/mvn" --batch-mode -V -U clean install -f "./pom.xml"
    docker build -t exomacr.azurecr.io/sb-web-sample-01-docker-alpha2:v$BUILD .
    docker push exomacr.azurecr.io/sb-web-sample-01-docker-alpha2:v$BUILD
    kubectl set image deployment/sb-web-sample-01-docker-alpha2 sb-web-sample-01-docker-alpha2=exomacr.azurecr.io/sb-web-sample-01-docker-alpha2:v$BUILD
fi
