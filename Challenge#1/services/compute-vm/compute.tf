
# BASTION EC2 INSTANCE
resource "aws_instance" "bastion" {

    ami                         = var.amis
    instance_type               = var.instance_type
    subnet_id                   = var.public_subnet1
    associate_public_ip_address = true
    key_name                    = "ec2_key"
    vpc_security_group_ids      = [var.output_bastion_ssh]
    tags                        = {
        Name                    = "Bastion_Host"
    }
  
}

#Elastic IP
resource "aws_eip" "bastion_eip" {

    instance                    = aws_instance.bastion.id
    vpc                         = true
  
}

#Private Subnet EC2
resource "aws_instance" "prv_sub_3_instance" {

    ami                         = var.amis
    instance_type               = var.instance_type
    subnet_id                   = var.private_subnet3
    key_name                    = "ec2_key"
    vpc_security_group_ids      = [ var.output_bastion_ssh, var.web_access_from_nat_prv_sg ]
    tags                        = {
        Name                    = "Instance_Pvt3"
    }
  
}

#Private Subnet EC2
resource "aws_instance" "prv_sub_4_instance" {

    ami                         = var.amis
    instance_type               = var.instance_type
    subnet_id                   = var.private_subnet4
    key_name                    = "ec2_key"
    vpc_security_group_ids      = [ var.output_bastion_ssh, var.web_access_from_nat_prv_sg ]
    tags                        = {
        Name                    = "Instance_Pvt4"
    }
  
}


