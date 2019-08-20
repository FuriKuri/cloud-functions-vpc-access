#!/bin/bash -e

gcloud compute firewall-rules create allow-nginx --network default --allow tcp:80

gcloud compute instances create-with-container nginx \
--machine-type=f1-micro \
--container-image=registry.hub.docker.com/library/nginx \
--tags=allow-nginx \
--zone=us-central1-a \
--private-network-ip=10.128.0.2 \
--network default