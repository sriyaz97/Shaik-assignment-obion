output "vpc_cidr" {
    value = module.vpc_networking.vpc_cidr
}

output "public_subnet_1_cidr" {
    value = module.vpc_networking.public_subnet_1_cidr
}
output "public_subnet_2_cidr" {
    value = module.vpc_networking.public_subnet_2_cidr
}
output "public_subnet_3_cidr" {
    value = module.vpc_networking.public_subnet_3_cidr
}

output "private_subnet_1_cidr" {
    value = module.vpc_networking.private_subnet_1_cidr
}
output "private_subnet_2_cidr" {
    value = module.vpc_networking.private_subnet_2_cidr
}
output "private_subnet_3_cidr" {
    value = module.vpc_networking.private_subnet_3_cidr
}

