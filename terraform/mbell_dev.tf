/**
* DNS Setup for mbell.dev domain.
*/

resource "cloudflare_zone" "mbell_dev" {
  zone = "mbell.dev"
}

resource "cloudflare_record" "root_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "mbell.dev"
  type    = "CNAME"
  value   = "maisieccino.github.io"
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

resource "cloudflare_record" "keybase_dns_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "mbell.dev"
  type    = "TXT"
  value   = "keybase-site-verification=9RFCAnjL7UOnnmh9JZEIxLsgFAJw8u7sJq5WPPULoAE"
  ttl     = var.dns_record_ttl
}

/**
* G SUITE
**/

resource "cloudflare_record" "google_site_verification_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "mbell.dev"
  type    = "TXT"
  value   = "google-site-verification=ym4hs30waHAYty1j4yWFYFxMgEIU92MFQrDfc8_2r4g"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "mx_p1_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "@"
  type     = "MX"
  value    = "mail.protonmail.ch"
  priority = 10
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_p2_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "@"
  type     = "MX"
  value    = "mailsec.protonmail.ch"
  priority = 20
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_1_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mbell.dev"
  type     = "MX"
  value    = "aspmx.l.google.com"
  priority = 30
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_2_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mbell.dev"
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  priority = 40
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_3_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mbell.dev"
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  priority = 50
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_4_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mbell.dev"
  type     = "MX"
  value    = "aspmx2.googlemail.com"
  priority = 60
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_5_mbell_dev" {
  zone_id  = cloudflare_zone.mbell_dev.id
  name     = "mbell.dev"
  type     = "MX"
  value    = "aspmx3.googlemail.com"
  priority = 70
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "spf_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "mbell.dev"
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch ~all"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "dkim1_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "protonmail._domainkey"
  type    = "CNAME"
  value   = "protonmail.domainkey.d2gisrcgiqhdpikbvg6lswmssjizfy2gkoc4lomwhkmgshvptc4ia.domains.proton.ch"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "dkim2_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "protonmail2._domainkey"
  type    = "CNAME"
  value   = "protonmail2.domainkey.d2gisrcgiqhdpikbvg6lswmssjizfy2gkoc4lomwhkmgshvptc4ia.domains.proton.ch"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "dkim3_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "protonmail3._domainkey"
  type    = "CNAME"
  value   = "protonmail3.domainkey.d2gisrcgiqhdpikbvg6lswmssjizfy2gkoc4lomwhkmgshvptc4ia.domains.proton.ch"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "blog_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "blog"
  type    = "CNAME"
  value   = "bell-blog.ghost.io"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "at_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "@"
  type    = "TXT"
  value   = "protonmail-verification=9ec445f24ecfa1a4b4719878fd9e0c6511878391"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "dmarc_mbell_dev" {
  zone_id = cloudflare_zone.mbell_dev.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=quarantine"
  type    = "TXT"
  ttl     = var.dns_record_ttl
}
