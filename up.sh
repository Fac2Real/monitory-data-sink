#!/bin/bash

docker-compose -f docker-compose-model.yml down -v
docker-compose -f docker-compose-service.yml down -v
docker-compose -f docker-compose-grafana.yml down -v
docker-compose -f docker-compose-source.yml down -v
docker-compose -f docker-compose.yml down -v
docker image prune -f

aws ecr get-login-password --region ap-northeast-2 \
 | docker login --username AWS --password-stdin 853660505909.dkr.ecr.ap-northeast-2.amazonaws.com

docker-compose -f docker-compose.yml up -d --pull always

sleep 3

docker-compose -f docker-compose-source.yml up -d --pull always

sleep 3

docker-compose -f docker-compose-grafana.yml up -d --pull always

sleep 3

docker-compose -f docker-compose-service.yml up -d --pull always

sleep 3

docker-compose -f docker-compose-model.yml up -d --pull always
