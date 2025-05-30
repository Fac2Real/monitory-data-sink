# custom kafka connect를 위한 도커파일

FROM confluentinc/cp-kafka-connect:latest

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-influxdb:latest

USER root

RUN microdnf install -y curl && microdnf clean all

USER appuser

EXPOSE 8083