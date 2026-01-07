#!/bin/bash
if [ $# -lt 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-hub-repo>"
  exit 2
fi

github=$1
repo=$(basename "$github")
tag=$2

if [ -d "$repo" ]; then
   rm -Rf $repo
fi

git clone https://github.com/$1.git
docker build -t $tag $repo
docker login --username $DOCKER_USER --password $DOCKER_PWD
docker push $tag
