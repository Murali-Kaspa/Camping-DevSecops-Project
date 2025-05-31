provider "aws"{
region = "ap-south-1"
}

resource "aws_instance" "DEV"{
instance_type = "t2.medium"
ami = "ami-0f340b1771dc25029"
tags ={
Name = "Dev-Instance"
Environment = "Dev"
Client="MuraliKaspa"
}
key_name="Macbook_Keypair.pem"
root_block_device{
volume_size = 20
}
}
