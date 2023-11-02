# DigitalXC-terraform-test
ec2-instance and RDS database scripts

Challenge: Infrastructure Provisioning with Terraform

Problem: You are tasked with provisioning cloud resources using Terraform to set up a basic web application infrastructure. Your infrastructure should consist of the following components:
An AWS EC2 instance running a basic web server.
An AWS RDS MySQL database for storing application data.
Write Terraform configuration files to provision this infrastructure.

Requirements:
Create an EC2 instance with the following specifications:
Instance Type: t2.micro
AMI: Ubuntu Server 20.04 LTS
Security Group: Allow incoming HTTP (port 80) and SSH (port 22) traffic.
Create an RDS MySQL instance with the following specifications:
Instance Class: db.t2.micro
Engine: MySQL
Allow incoming traffic on port 3306 from the EC2 instance's security group.

Instructions:
Create a directory named terraform_challenge.
Inside the directory, create the following Terraform files:
main.tf: Define your resources here.
variables.tf: Define variables for customization.
outputs.tf: Define outputs for displaying useful information.


