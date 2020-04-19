variable "mc_server_key" {
  description = "Minecraft server private key"
}

variable "mc_server_key_pub" {
  description = "Minecraft server public key"
}

variable "dns_name" {
  description = "Server DNS name"
}

variable "le_email" {
  description = "Let's Encrypt email address"
}

variable "unused_craft_dns_meta" {
  description = "Unused variable to coerce module creation _after_ DNS records."
}
