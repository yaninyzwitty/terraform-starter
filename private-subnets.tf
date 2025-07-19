resource "aws_subnet" "private" {
  for_each = local.private_subnets


  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name                                = "${local.env}-private-${each.value.az}"
    "kubernetes.io/role/internal-elb"   = "1"     # correct key for private ELBs
    "kubernetes.io/cluster/dev-cluster" = "owned" # tag for cluster ownership
  }
}

# resource "aws_subnet" "private_zone2" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-2b"

#   tags = {
#     Name                                = "dev-private-us-east-2b"
#     "kubernetes.io/role/internal-elb"   = "1"
#     "kubernetes.io/cluster/dev-cluster" = "owned"
#   }
# }
