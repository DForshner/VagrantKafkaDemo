#!/bin/bash

# Exit if simple command fails
set -e

# Quick test that sanity check that kafka is up and running
echo "--- Test Kafka - Start ---"

echo "=Create test topic="
~/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1  --topic test

echo "=Send some messages to test topic="
echo "Looks good!" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
echo "Also good!" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
# TODO: kafka-console-producer.sh ... < foo.json 

echo "=List topics="
~/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181

echo "=Consume some messages from test topic="
~/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning --max-messages 2 

echo "=Delete test topic="
~/kafka/bin/kafka-topics.sh --delete --zookeeper localhost:2181 --topic test

echo "--- Test Kafka - End ---"
