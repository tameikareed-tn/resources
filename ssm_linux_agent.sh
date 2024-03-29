#!/bin/bash

set -x 

DIR="/boot"
SSM_RPM="https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm"

echo "Checking for directory post_launch in boot"
if [ -f  "$DIR/post_launch" ]
then
      echo "We have success the dir is there"	
fi

echo "Downloading ssm-agent rpm"
sudo wget $SSM_RPM  -P  $DIR/post_launch 

echo "Do a yum local install of the agent"
sudo yum -y localinstall $DIR/post_launch/amazon-ssm-agent.rpm


echo "Enalbe the service for SSM agent"
sudo systemctl enable amazon-ssm-agent


echo "Start the agent"
sudo systemctl start amazon-ssm-agent

echo "Confirm status of agent running"
sudo systemctl status amazon-ssm-agent
