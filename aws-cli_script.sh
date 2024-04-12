#!/bin/bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/home/ec2-user/awscliv2.zip"
unzip /home/ec2-user/awscliv2.zip -d /home/ec2-user/awscliv2
sudo /home/ec2-user/awscliv2/aws/install