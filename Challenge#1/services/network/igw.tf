resource "aws_internet_gateway" "gw" {
        vpc_id = aws_vpc.vpctech.id

        tags   = {
        Name   = "Internet Gateway_Tech"
        }
  
}



