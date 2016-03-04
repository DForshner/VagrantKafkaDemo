#!/bin/bash

# Exit if simple command fails
set -e

vagrant_dir=/vagrant/vagrant
bashrc=/home/vagrant/.bashrc

# TODO: Setup paths
set KAFKA_HOME "~/kafka/"
set ZOO_KEEPER_HOME "/usr/local/zookeeper/"

echo "--- Provisioning - Start ---"

# ----------------------------------------------- General
sudo apt-get update

# ----------------------------------------------- Java 

# TODO: sudo apt-get default-jre
sudo apt-get -y install openjdk-7-jdk

# ----------------------------------------------- Zoo Keeper

# Should install and start daemon on port: 2181
sudo apt-get -y install zookeeperd

# Sanity check that zoo keeper is running
# TODO: Fix this
echo "--- Test Zoo Keeper - Start ---"
#sudo apt-get -y install expect
#expect test-zookeeper.bash
#echo "<= Should have responded 'imok'"
echo "--- Test Zoo Keeper - End ---"

# ----------------------------------------------- Kafka Install

mkdir -p ~/Downloads
wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz" -O ~/Downloads/kafka.tgz

mkdir -p ~/kafka 
cd ~/kafka
tar -xvzf ~/Downloads/kafka.tgz --strip 1

# ----------------------------------------------- Kafka Config

# Allow topics to be deleted
echo "delete.topic.enable = true" >> ~/kafka/config/server.properties

# ----------------------------------------------- Kafka Start 

# Start as background process
nohup ~/kafka/bin/kafka-server-start.sh ~/kafka/config/server.properties > ~/kafka/kafka.log 2>&1 &

# TODO: Check if ready instead of waiting
sleep 5

bash test-kafka.bash

echo "--- Provisioning - End ---"
