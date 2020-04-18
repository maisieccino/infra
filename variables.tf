variable "do_token" {
  description = "DigitalOcean API token"
}

variable "cloudflare_email" {
  description = "Email address for cloudflare"
}

variable "cloudflare_api_key" {
  description = "API key for cloudflare"
}

variable "mc_server_key" {
  description = "Minecraft server private key"
}

variable "mc_server_key_pub" {
  description = "Minecraft server public key"
}

variable "dns_record_ttl" {
  description = "Default TTL for DNS records"
  default     = 3600
}
