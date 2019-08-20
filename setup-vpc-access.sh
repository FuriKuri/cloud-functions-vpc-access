#!/bin/bash -e

gcloud compute instances delete-access-config nginx

gcloud services enable vpcaccess.googleapis.compute

gcloud beta compute networks vpc-access connectors create nginx-connector \
--network default \
--region us-central1 \
--range 10.8.0.0/28 \
--min-throughput 200 \
--max-throughput 400