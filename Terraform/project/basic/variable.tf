variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "ami" {
  default = "ami-0f5ee92e2d63afc18"
  
}

variable "instance_type" {
  default = "t2.micro"
  type = string
}
