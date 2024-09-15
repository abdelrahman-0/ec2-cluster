variable "availability_zone" {
  description = "AZ"
  type        = string
  default     = "eu-central-1b"
}

variable "max_price" {
  description = "Maximum price for instance ($)"
  type        = number
  default     = 1.9
}

variable "spot_instance" {
  description = "Whether to use a spot instance or not"
  type        = bool
  default     = "true"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "i3en.6xlarge"
}

variable "num_nodes" {
  description = "Number of instances"
  type        = number
  default     = 1
}

variable "use_placement_group" {
  description = "Whether or not to use a cluster placement group (disable when using > 4 nodes )"
  type        = bool
  default     = null
}

variable "placement_strategy" {
  description = "Placement group strategy"
  type        = string
  default     = "cluster"
}

variable "ssh_key" {
  description = "Name of ssh key pair used to connect to the EC2 instance(s)"
  type        = string
  default     = "ssh key"
}