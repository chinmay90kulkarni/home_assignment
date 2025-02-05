variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone for subnets"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# We need to create this key manually
# key name should be - my-valid-key
variable "key_name" {
  description = "Key pair name for EC2 instance"
  type        = string
  default     = "my-valid-key"
}

variable "docker_image" {
  description = "Docker image to run on EC2 instance"
  type        = string
  default     = "yeasy/simple-web"
}

# This is the public IP address of host computer
# https://whatismyipaddress.com
variable "bastion_allowed_cidr" {
  description = "The CIDR block allowed to SSH into the Bastion Host"
  type        = string
  default     = "<public_ip_address>/32" 
}
