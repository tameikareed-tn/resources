#!/bin/bash

set -x 

echo "Creating directory called post_launch in boot"
sudo mkdir /boot/post_launch

echo "Downloading ssm-agent rpm"
sudo wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -P /boot/post_launch 

echo "Do a yum local install of the agent"
sudo yum -y localinstall /boot/post_launch/amazon-ssm-agent.rpm
