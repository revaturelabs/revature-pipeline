#!/bin/bash

#@Peter Alagna

#Install Git
sudo yum install -y git

#Install Maven (Brings OpenJDK 1.8)
sudo yum install -y maven

#Install Tomcat (As a service)
#Configuration will be in /etc/tomcat
#Webapps is in /usr/share/tomcat/webapps
sudo yum install -y tomcat

#Start tomcat
sudo service tomcat start

#Get Jenkins
wget http://mirrors.jenkins.io/war/latest/jenkins.war

#Move war to webapps folder
sudo mv jenkins.war /usr/share/tomcat/webapps/

#Force curl to jenkins
curl localhost:8080/jenkins

#Create IP table to forward port 80:8080 @Quintin Donnelly
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables-save > /etc/iptables.conf
