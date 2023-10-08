variable "cidr" {
    default = "10.0.0.0/16"
}


variable "sub1" {
    default = "10.0.0.0/24"
}

variable "sub2" {
    default = "10.0.1.0/24"
}
variable "availability_zone1" {
    default = "ap-south-1a"
  
}

variable "availability_zone2" {
    default = "ap-south-1b"
  
}

variable "instance_type" {
  default = "t2.small"
}
