#!/bin/bash

# Define variables for ACR1 and ACR2
ACR1="lpacrdev.azurecr.io"
ACR2="lpacrtrn.azurecr.io"
IMAGE_NAME="$1"
TAG="$2"


# Pull the image from ACR1
docker pull $ACR1/$IMAGE_NAME:$TAG

# Tag the image with ACR2
docker tag $ACR1/$IMAGE_NAME:$TAG $ACR2/$IMAGE_NAME:$TAG



# Push the image to ACR2
docker push $ACR2/$IMAGE_NAME:$TAG


