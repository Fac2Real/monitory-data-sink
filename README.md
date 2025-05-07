# Kafka Sink Connector 운영 가이드

## 🐳 Docker Compose

### 실행
```bash
docker-compose up -d
```

### 종료 및 볼륨 삭제
```bash
docker-compose down -v
```

---

## 🔌 Kafka Sink Connector 등록 및 삭제

### 🔁 등록 - InfluxDB Sink Connector
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  --data '@influxdb-sink-config.json' \
  http://localhost:8083/connectors
```

### ❌ 삭제 - InfluxDB Sink Connector
```bash
curl -X DELETE http://localhost:8083/connectors/influxdb-sink-connector
```

### ☁️ 등록 - S3 Sink Connector
```bash
curl -i -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  --data @s3-sink-config.json \
  http://localhost:8083/connectors
```

---

## 🧪 Kafka 메시지 확인 (Kafka 컨테이너 내부)
```bash
kafka-console-consumer \
  --bootstrap-server kafka:9093 \
  --topic EQUIPMENT \
  --from-beginning
```

---

## ☁️ AWS CLI 설정
```bash
aws configure
```

---

## 📌 기타 참고

- `sink-connector`는 Kafka Connect의 REST API를 통해 등록 및 삭제합니다.
- S3 또는 InfluxDB와의 연동 전, 인증키 및 접속 설정이 올바른지 확인하세요.
