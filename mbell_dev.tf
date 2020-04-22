/**
* DNS Setup for mbell.dev domain.
*/

resource "cloudflare_zone" "mbell_dev" {
  zone = "mbell.dev"
}

resource "cloudflare_record" "blog_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "blog"
  type    = "A"
  value   = "35.190.165.107"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "root_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "mbell.dev"
  type    = "CNAME"
  value   = "mbellgb.github.io"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "mg_mbell_dev_1" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mg"
  type     = "MX"
  value    = "mxa.eu.mailgun.org"
  priority = 10
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mg_mbell_dev_2" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mg"
  type     = "MX"
  value    = "mxb.eu.mailgun.org"
  priority = 10
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mg_domainkey_mg_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "k1._domainkey.mg"
  type    = "TXT"
  value   = "k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA13n2wi8fkcsfx8g7aylYChv+O652LjTY7xhf9kbHu1Q4kU81W6hu5V4l444sSjAMErCJDyaaG0I975jt2hQ6ckPrG7Vook95EdMfuVn5gNKjZxdu8VBkBQIBM0UJSmLYCJvNkk4FPo31fXxpSvMA3BHdq7d4u62iwL/w2sKy5ga9aGeEOFn2wXIFLlul8926FRVJGcCyx/4ZDQbZkdgieKePV6EK6H4Y8Ms6KxddqxV20Cdk1ZmeePDbee+r2fhj5YYrlSkX0IeDeYzOD1xX/Q9T7oRdXYCvl6WJo1IGL30y6pWxm6dC9oHHqoSigEY0LMezp7ah5ydunA/3YQEWdQIDAQAB"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "mg_txt_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "mg"
  type    = "TXT"
  value   = "v=spf1 include:eu.mailgun.org ~all"
  ttl     = var.dns_record_ttl
}

