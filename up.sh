#!/bin/bash

docker-compose -f docker-compose.yml up -d --build

sleep 3

docker-compose -f docker-compose-source.yml up -d --build

sleep 3

docker-compose -f docker-compose-grafana.yml up -d --build

sleep 3

docker-compose -f docker-compose-service.yml up -d --build
