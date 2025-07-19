resource "aws_subnet" "public" {

  count                   = length(local.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.public_subnets[count.index]
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true # Automatically assign public IPs

  tags = {
    Name                                = "${local.env}-public-${local.azs[count.index]}"
    "kubernetes.io/role/elb"            = "1"     # Correct ELB tag for public subnet
    "kubernetes.io/cluster/dev-cluster" = "owned" # Tag for EKS cluster association
  }
}
# resource "aws_subnet" "public_zone1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "us-east-2a"
#   map_public_ip_on_launch = true # Automatically assign public IPs

#   tags = {
#     Name                                = "dev-public-us-east-2a"
#     "kubernetes.io/role/elb"            = "1"     # Correct ELB tag for public subnet
#     "kubernetes.io/cluster/dev-cluster" = "owned" # Tag for EKS cluster association
#   }
# }

# resource "aws_subnet" "public_zone2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.2.0/24"
#   availability_zone       = "us-east-2b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name                                = "dev-public-us-east-2b"
#     "kubernetes.io/role/elb"            = "1"
#     "kubernetes.io/cluster/dev-cluster" = "owned"
#   }
# }
