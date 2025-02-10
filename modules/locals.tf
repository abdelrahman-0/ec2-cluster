locals {
  instance_user_data = file("${path.module}/../../grasshopper-db/install_dependencies.sh")
}