# VagrantKafkaDemo
Kafka demo using Vagrant to provision the environment.  Currently shows producing and consuming 
from the queue using bash scripts.

## Running

1) Provision environment - Creat the VM, install everything, and run test-kafka.bash script.

vagrant up

2) Run producer/consumer demo

## Requirements
* VirtualBox
* Vagrant

# Network Debugging Tips
* You can telnet to zookeeper (port 2181) and type "ruok" and it will repond "imok"
* You can telnet to kafka (port 9092) and it will open a connection and close it when you press any key.
