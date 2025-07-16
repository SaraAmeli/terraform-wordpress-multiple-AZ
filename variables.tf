variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 in us-west-2
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}


variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-west-2"
}
