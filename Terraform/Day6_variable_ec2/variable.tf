variable "ami-id" {
  description = "this variable used for defining ami id of ubuntu 20"
  default     = "ami-**********"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws-region" {
  default = "ap-south-1"
}
