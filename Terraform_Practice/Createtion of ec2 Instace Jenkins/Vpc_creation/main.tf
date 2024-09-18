provider "aws" {
    region = var.east_region
}

provider "aws" {
    region = var.west_region
}

resource "aws_vpc" "east_vpc" {
    cidr_block = var.east_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name = var.west_vpc_name
    }
}

resource "aws_vpc" "west_vpc" {
    cidr_block = var.west_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name = var.west_vpc_name
    }
}