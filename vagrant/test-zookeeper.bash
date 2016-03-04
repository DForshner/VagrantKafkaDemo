#!/usr/bin/expect

# Quick sanity check that the zoo keeper daemon has started

set timeout 10

set port 2181

set stty_init raw

spawn telnet localhost $port 

expect "Escape character is '^]'."

send "ruok"

expect "imok"
