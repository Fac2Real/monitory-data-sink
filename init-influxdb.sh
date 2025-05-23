#!/bin/bash

# 초기화 대기
sleep 3

# 데이터베이스 생성
influx -execute "CREATE DATABASE monitory"

# 사용자 생성 및 권한 부여
influx -execute "CREATE USER myuser WITH PASSWORD 'mypassword' WITH ALL PRIVILEGES"

# 연결 확인
influx -execute "SHOW DATABASES"
