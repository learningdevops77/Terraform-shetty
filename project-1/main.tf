provider "aws" {
    region = "ap-south-1"

}

#creating VPC

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = "true" #Your EC2 itself gets a name (a DNS name).
    enable_dns_support = "true" #Your EC2 can understand website names like google.com or amazon.com.
    tags = {
      Name = "VPC-Project"
    }
}

#creating Subnet-1

resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-soth-1a"
    map_public_ip_on_launch = "true"  
    #Every EC2 instance launched in that subnet will automatically get a public IP address.
    # If map_public_ip_on_launch = true → instance gets a public IP → you can SSH or access it from your laptop.
    #If map_public_ip_on_launch = false → instance only has a private IP → you can’t access it from the internet (only from inside the VPC).
}

#creating Subnet-2

resource "aws_subnet" "subnet_2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.1.0.0/24"
    availability_zone = "ap-soth-1b"
    map_public_ip_on_launch = "true" 
    
}

#creating internet gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-vpc.id
  
}

#creating route table

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my-vpc.id

}

#craeting the route 

resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    
}

#creating route association

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.subnet_1.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
