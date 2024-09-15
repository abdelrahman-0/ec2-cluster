module "ec2_instance" {
  version = ">= 4.66"
  source  = "terraform-aws-modules/ec2-instance/aws"

  count                  = var.num_nodes
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  availability_zone      = var.availability_zone

  # IPs 10.0.0.0 - 10.0.0.3 are reserved
  private_ip                  = "10.0.0.${count.index + 4}"
  associate_public_ip_address = true
  name                        = "grasshopper-db-cluster-node_${count.index}"
  create_spot_instance        = var.spot_instance
  instance_type               = var.instance_type
  placement_group             = var.use_placement_group ? aws_placement_group.cluster_pg.id : null

  spot_price = var.max_price
  spot_type  = "persistent"
  key_name   = var.ssh_key
  ami        = "ami-07652eda1fbad7432" # "ami-09a1c459d70c72b96"
  user_data  = local.instance_user_data


  tags = {
    Name = "Node ${count.index} (Grasshopper DB)"
  }
}

resource "aws_placement_group" "cluster_pg" {
  name     = "grasshopper-db-pg"
  strategy = var.placement_strategy
}