#!/bin/bash -e

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:service-$PROJECT_NUMBER@gcf-admin-robot.iam.gserviceaccount.com \
--role=roles/viewer

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:service-$PROJECT_NUMBER@gcf-admin-robot.iam.gserviceaccount.com \
--role=roles/compute.networkUser

VPC_CONNECTOR=projects/$PROJECT_ID/locations/us-central1/connectors/nginx-connector

gcloud beta functions deploy nginx-access --entry-point callNginx \
--runtime nodejs8 \
--trigger-http \
--region us-central1 \
--vpc-connector $VPC_CONNECTOR \
--set-env-vars NGINX_HOST=10.128.0.2