# custom kafka connect를 위한 도커파일

FROM confluentinc/cp-kafka-connect:latest

USER root

RUN microdnf install -y curl --disablerepo=temurin-jdk && microdnf clean all

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-influxdb:1.2.11

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"

USER appuser

EXPOSE 8083