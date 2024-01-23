// 1. VPC Subnet variables
variable "public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24"]
}

// 2. AZS variables
variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

// Subnet 생성 정의
resource "aws_subnet" "public_subnets" {
  count            = length(var.public_subnet)
  vpc_id           = aws_vpc.terraformVPC.id
  cidr_block       = element(var.public_subnet, count.index)
  availability_zone = element(var.azs, count.index)
  
  tags = {
    Name = "Public Subnet0${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count            = length(var.private_subnet)
  vpc_id           = aws_vpc.terraformVPC.id
  cidr_block       = element(var.private_subnet, count.index)
  availability_zone = element(var.azs, count.index)
  
  tags = {
    Name = "Private Subnet0${count.index + 1}"
  }
}
