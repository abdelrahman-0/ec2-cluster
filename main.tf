module "cluster" {
  source = "./modules"

  instance_type     = "c6in.16xlarge" # t2.micro c6in.8xlarge c6in.16xlarge c6gn.16xlarge
  num_nodes         = 4
  availability_zone = "eu-central-1a"

  max_price     = 2
  spot_instance = false

  use_placement_group = true
  placement_strategy  = "cluster"

  ssh_key = "ssh key"
}
