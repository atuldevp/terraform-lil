
variable "imageid"{
    description = "Default Image Id"
    #type = string
    default = "ami-0d2692b6acea72ee6"
}

variable "az"{
    description = "Default AZ to launch new instances"
    #type = string
    default = "ap-south-1a"
}

resource "aws_instance" "webserver1"{
    ami = "${var.imageid}"
    instance_type = "t2.micro"
    availability_zone = "${var.az}"

    tags = {
        Name = "WebServer1"
    }
}