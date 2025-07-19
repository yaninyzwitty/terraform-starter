# resource "aws_security_group" "web" {
#   name   = "web"
#   vpc_id = aws_vpc.main.id

#   #   ingress {
#   #     from_port   = 22
#   #     to_port     = 22
#   #     protocol    = "tcp"
#   #     cidr_blocks = ["63.10.10.10/32"]
#   #   }

#   #   ingress {
#   #     from_port   = 80
#   #     to_port     = 80
#   #     protocol    = "tcp"
#   #     cidr_blocks = ["0.0.0.0/0"]
#   #   }

#   dynamic "ingress" {
#     for_each = local.ingress

#     content {
#       from_port   = ingress.key
#       to_port     = ingress.key
#       protocol    = "tcp"
#       cidr_blocks = [ingress.value]
#     }

#   }

#   dynamic "egress" {
#     for_each = local.egress

#     content {
#       from_port   = ingress.key
#       to_port     = ingress.key
#       protocol    = "tcp"
#       cidr_blocks = [ingress.value]
#     }

#   }



#   #   egress {
#   #     from_port   = 0
#   #     to_port     = 0
#   #     protocol    = "-1"
#   #     cidr_blocks = ["0.0.0.0/0"]
#   #   }
# }
