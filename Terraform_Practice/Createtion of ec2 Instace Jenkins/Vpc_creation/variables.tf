variable "east_region" {
    description = "The region in which the EC2 instance will be created"
    type = string
    default = "us-east-1"
}

variable "west_region" {
    description = "value of the west region"
    type = string
    default = "us-west-2"
}

variable "east_vpc_name" {
    description = "The name of the VPC in the east region"
    type = string
    default = "east_vpc"
}

variable "west_vpc_name" {
    description = "The name of the VPC in the west region"
    type = string
    default = "west_vpc"
}

variable "east_cidr_block" {
    description = "The CIDR block for the VPC in the east region"
    type = string
    default = "10.0.0.0/16"
}

variable "west_cidr_block" {
    description = "The CIDR block for the VPC in the west region"
    type = string
    default = "10.1.0.0/16"
}