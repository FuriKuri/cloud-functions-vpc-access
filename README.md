# cloud-functions-vpc-access

## Setup

```
# Create a vm with a nginx listen on port 80
$ ./setup-nginx.sh

# When the isntance is running, create a serverless vpc access
$ ./setup-vpc-access.sh

# Prepare IAM polices for gcf and deploy the nodejs function.
# Set $PROJECT_ID and $PROJECT_NUMBER to run the script
$ ./deploy-fn.sh

# Call the functions
$ gcloud functions call --data '{}' nginx-access
```