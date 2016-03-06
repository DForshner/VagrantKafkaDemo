# VagrantKafkaDemo
A kafka demo using Vagrant to provision the environment.  The idea is to launch a Kafka broker in a VM and then interact with it from the host using the kafka-net client library.

## Running

1) Provision environment - Creat the VM, install everything, and run test-kafka.bash script.

vagrant up

2) Run producer/consumer demo

## Requirements
* VirtualBox
* Vagrant

# Network Debugging Tips
* Can telnet to zookeeper (port 2181) and type "ruok" and it will respond "imok"
* Can telnet to kafka (port 9092) and it will open a connection and close it when you press any key.
