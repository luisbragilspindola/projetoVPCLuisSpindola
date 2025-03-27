#!/bin/bash
#Criando a VPC
aws ec2 create-vpc --cidr-block "10.0.0.0/16" --instance-tenancy "default" --tag-specifications '{"resourceType":"vpc","tags":[{"key":"Name","value":"projetoLuisSpindola-vpc"}]}' 
aws ec2 modify-vpc-attribute --vpc-id "preview-vpc-1234" --enable-dns-hostnames '{"value":true}' 
aws ec2 describe-vpcs --vpc-ids "preview-vpc-1234" 
aws ec2 create-subnet --vpc-id "preview-vpc-1234" --cidr-block "10.0.0.0/20" --availability-zone "us-east-1a" --tag-specifications '{"resourceType":"subnet","tags":[{"key":"Name","value":"projetoLuisSpindola-subnet-public1-us-east-1a"}]}' 
aws ec2 create-subnet --vpc-id "preview-vpc-1234" --cidr-block "10.0.128.0/20" --availability-zone "us-east-1a" --tag-specifications '{"resourceType":"subnet","tags":[{"key":"Name","value":"projetoLuisSpindola-subnet-private1-us-east-1a"}]}' 
aws ec2 create-internet-gateway --tag-specifications '{"resourceType":"internet-gateway","tags":[{"key":"Name","value":"projetoLuisSpindola-igw"}]}' 
aws ec2 attach-internet-gateway --internet-gateway-id "preview-igw-1234" --vpc-id "preview-vpc-1234" 
aws ec2 create-route-table --vpc-id "preview-vpc-1234" --tag-specifications '{"resourceType":"route-table","tags":[{"key":"Name","value":"projetoLuisSpindola-rtb-public"}]}' 
aws ec2 create-route --route-table-id "preview-rtb-public-0" --destination-cidr-block "0.0.0.0/0" --gateway-id "preview-igw-1234" 
aws ec2 associate-route-table --route-table-id "preview-rtb-public-0" --subnet-id "preview-subnet-public-0" 
aws ec2 create-route-table --vpc-id "preview-vpc-1234" --tag-specifications '{"resourceType":"route-table","tags":[{"key":"Name","value":"projetoLuisSpindola-rtb-private1-us-east-1a"}]}' 
aws ec2 associate-route-table --route-table-id "preview-rtb-private-1" --subnet-id "preview-subnet-private-1" 
aws ec2 describe-route-tables --route-table-ids  "preview-rtb-private-1" 

#Criando a Instância
aws ec2 run-instances --image-id "ami-084568db4383264d4" --instance-type "t2.micro" --instance-initiated-shutdown-behavior "stop" --key-name "projetoLuisSpindola" --block-device-mappings '{"DeviceName":"/dev/sda1","Ebs":{"Encrypted":false,"DeleteOnTermination":true,"Iops":3000,"SnapshotId":"snap-0edbe0f6601b2861c","VolumeSize":30,"VolumeType":"gp3","Throughput":125}}' --network-interfaces '{"SubnetId":"subnet-06b31ca27f7f4374e","AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-0c749c4b2bb8ea511"]}' --credit-specification '{"CpuCredits":"standard"}' --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"projetoLuisSpindoEC2"}]}' --metadata-options '{"HttpEndpoint":"enabled","HttpPutResponseHopLimit":2,"HttpTokens":"required"}' --private-dns-name-options '{"HostnameType":"ip-name","EnableResourceNameDnsARecord":false,"EnableResourceNameDnsAAAARecord":false}' --count "1" 
