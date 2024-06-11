# create aws ECR repos

```
aws ecr create-repository --repository-name weatherapp-db --region us-east-1 --output json
aws ecr create-repository --repository-name weatherapp-redis --region us-east-1 --output json
aws ecr create-repository --repository-name weatherapp-ui --region us-east-1 --output json
aws ecr create-repository --repository-name weatherapp-weather --region us-east-1 --output json
aws ecr create-repository --repository-name weatherapp-auth --region us-east-1 --output json

```

# building images
```
docker build -t <ECR-REPOSITORY-URI>:<TAG> .
docker build -t 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-db:develop .
docker build -t 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-redis:develop .
docker build -t 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ui:develop .
docker build -t 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-auth:develop .
docker build -t 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-weather:develop .

```

# login to ecr repos

```
aws ecr get-login-password --region [your-region] | docker login --username AWS --password-stdin [ECR-REPO-URI]

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-db

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ui

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-redis

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-auth

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-weather

 ```

 # to forcefully stop and remove containers

 ```
  docker rm -f $(docker ps -aq)
```

# to delete all networks and images
```
  docker network prune -f
  docker rmi -f $(docker images -q) # to delete all images
  docker rmi -f $(docker images -q)
  ```
# to clear docker cache by cleaning up unused build cache and related artifacts specifically related to Docker BuildKit.
docker buildx prune

# pushing build images to AWS ECR 

docker push 763237209150.dkr.ecr.us-east-1.amazonaws.com/weatherapp-db:develop






