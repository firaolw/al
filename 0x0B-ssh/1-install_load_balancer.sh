#!/usr/bin/env bash
# set up load balancer
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:vbernat/haproxy-1.8
sudo apt-get -y update
sudo apt-get -y install haproxy

sudo sed -i -e '$aENABLED=1\n' /etc/default/haproxy
sudo sed -i -e '$a\listen http-in\n\tbind :80\n\tbalance roundrobin\n\tserver 40161-web-01 54.166.175.55:80 check\n\tserver 40161-web-02 100.25.192.7:80 check\n' /etc/haproxy/haproxy.cfg
sudo service haproxy restart

