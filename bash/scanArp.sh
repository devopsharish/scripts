#!/bin/bash

echo "Scanning Subnet"
for i in $(arp -a); do echo $i |tr -d '()' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'; done > ips.txt

for i in $(cat ips.txt); do nmap -v $i; done

echo "Done Scanning Subnet"
