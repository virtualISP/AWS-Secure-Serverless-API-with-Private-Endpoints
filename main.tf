module "network" {
  source             = "./modules/network"
  project_name       = var.project_name
  region             = var.region
  availability_zone  = var.availability_zone
  vpc_cidr           = "10.0.0.0/16"
  private_subnet_cidr = "10.0.1.0/24"
}

module "app" {
  source             = "./modules/app"
  project_name       = var.project_name
  vpc_id             = module.network.vpc_id
  private_subnet_id  = module.network.private_subnet_id
}

