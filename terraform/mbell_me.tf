/**
* DNS Setup for mbell.me domain.
*/

# resource "cloudflare_zone" "mbell_me" {
#   zone = "mbell.me"
# }
#
# resource "cloudflare_record" "root_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mbell.me"
#   type    = "CNAME"
#   value   = "mbellgb.github.io"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "mail_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mail"
#   type    = "CNAME"
#   value   = "ghs.googlehosted.com"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "oldblog_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "oldblog"
#   type    = "CNAME"
#   value   = "mbellgb.github.io"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "openticket_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "openticket"
#   type    = "CNAME"
#   value   = "open-ticket.github.io"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "www_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "www"
#   type    = "CNAME"
#   value   = "mbellgb.github.io"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "txt_keybase_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mbell.me"
#   type    = "TXT"
#   value   = "keybase-site-verification=5DbkKJphBL_WTuY8oGz4ioKtvWorhbpbBYyZzTRbuw0"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "txt_mg_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mg"
#   type    = "TXT"
#   value   = "v=spf1 include:mailgun.org ~all"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "txt_domainkey_mx_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mx._domainkey.mg"
#   type    = "TXT"
#   value   = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDGZxUEsq6rWpHKHMkX4pbei5PBHd98OtlhVV2G8yUp8+bWqGgx+u0jehjJtCGu34IQuUXFLHEIDKCz2buJM87BAUy0/acTNhbR0DAXzb91JkdkI62lfI1Ds41kOgHfjTcnPmHfNe22jAZOeKXZkbQokVkhBj0LygMC07yeLSlZdwIDAQAB"
#   ttl     = var.dns_record_ttl
# }
#
# /**
# * G SUITE
# **/
#
# resource "cloudflare_record" "txt_google_site_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mbell.me"
#   type    = "TXT"
#   value   = "google-site-verification=1TVRPSOrcCR5EMwP_LY96-GbqSOo4-gUkcdik-r0-Zo"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "mx_1_mbell_me" {
#   zone_id  = cloudflare_zone.mbell_me.id
#   name     = "mbell.me"
#   type     = "MX"
#   value    = "aspmx.l.google.com"
#   priority = 1
#   ttl      = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "mx_2_mbell_me" {
#   zone_id  = cloudflare_zone.mbell_me.id
#   name     = "mbell.me"
#   type     = "MX"
#   value    = "alt1.aspmx.l.google.com"
#   priority = 5
#   ttl      = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "mx_3_mbell_me" {
#   zone_id  = cloudflare_zone.mbell_me.id
#   name     = "mbell.me"
#   type     = "MX"
#   value    = "alt2.aspmx.l.google.com"
#   priority = 5
#   ttl      = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "mx_4_mbell_me" {
#   zone_id  = cloudflare_zone.mbell_me.id
#   name     = "mbell.me"
#   type     = "MX"
#   value    = "aspmx2.googlemail.com"
#   priority = 10
#   ttl      = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "mx_5_mbell_me" {
#   zone_id  = cloudflare_zone.mbell_me.id
#   name     = "mbell.me"
#   type     = "MX"
#   value    = "aspmx3.googlemail.com"
#   priority = 10
#   ttl      = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "spf_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "mbell.me"
#   type    = "TXT"
#   value   = "v=spf1 include:_spf.google.com ~all"
#   ttl     = var.dns_record_ttl
# }
#
# resource "cloudflare_record" "dkim_mbell_me" {
#   zone_id = cloudflare_zone.mbell_me.id
#   name    = "google._domainkey"
#   type    = "TXT"
#   value   = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhcpXRbeFBqvpvS67jL6udxp/DGdjooQtikSS7ksZ9QuPgF2uKrVUB1KdEEho5NuQShr7nHw7c57ujC08hugH8srlAWMznBd4j68k24gjF8YUgLyb2Q4SMFQVfJfS61Me+VHHzIzU7NE6NAMCj1LfUVnNpIz3srY7kpk3GauHTh0RAKp5MOItR4ISHyBDYFYyF5kIR2uhUVd7Bgye2TCRiF5RK7EfoghrT+XAO/FrhEO7AyPhgG2OQWRD4X6F1XxDHsqiugzApwZb9OsaqDbdmzxI88U4X0eDGZSgYKRFsv5NBdkf1QiNsV1D3ZNkiAdV4Nn5QPsrkjlqTcLzFufzJQIDAQAB"
#   ttl     = var.dns_record_ttl
# }
