#!/bin/bash

echo "Scanning Subnet"

function nmapScan(){

cidr=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

echo Scanning for $cidr/24

nmap -v -F $cidr/24

}

function parseHost(){

echo "Parsing Hosts"


echo "Finished Parsing Hosts"

}

nmapScan
parseHost


echo "Done Scanning Subnet"
