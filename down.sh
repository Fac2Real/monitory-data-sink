#!/bin/bash

docker-compose -f docker-compose-service.yml down -v
docker-compose -f docker-compose-grafana.yml down -v
docker-compose -f docker-compose-source.yml down -v
docker-compose -f docker-compose.yml down -v

