#!/bin/bash
set -e

if [ $# -lt 2 ]; then
  echo "Not enough arguments."
  echo "Usage: builder.sh <github-repo> <docker-hub-repo>"
  exit 2
fi

github=$1
repo=$(basename "$github")
tag=$2

if [ -d "$repo" ]; then
   echo "found directory $repo. Deleting ..."
   rm -Rf $repo
fi

echo "cloning repo $1"
git clone https://github.com/$1.git

echo "building docker image ..."
docker build -t $tag $repo

echo "logging in to Docker Hub ..."
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

echo "pushing image ..."
docker push $tag

exit 0
