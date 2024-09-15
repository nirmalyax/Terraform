variable "aws_region" {
  description = "The AWS region"
  type = string
  default = "us-west-2"
}

variable "ami_id" {
  description = "The type of AMI ID for the jenkins server"
  type = string
  default = "ami-0c55b1" #Example AMI id , replace with the appropriate one for Jenkins
}

variable "instance_type" {
  description = "The type of Instance to be created"
  type = string
  default = "t2-medium"
}

variable "key_name" {
  description = "The name of the key-pair to use for the instance"
  type = string
  default = "my-key-pair"
}

variable "instance_name" {
  description = "The name of the key-pair to use for the instance"
  type = string
  default = "Jenkins Server"
}
