/**
* DNS Setup for mbell.me domain.
*/

resource "cloudflare_zone" "mbell_me" {
  zone = "mbell.me"
}

resource "cloudflare_record" "root_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "mbell.me"
  type    = "CNAME"
  value   = "mbellgb.github.io"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "mail_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "mail"
  type    = "CNAME"
  value   = "ghs.googlehosted.com"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "oldblog_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "oldblog"
  type    = "CNAME"
  value   = "mbellgb.github.io"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "openticket_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "openticket"
  type    = "CNAME"
  value   = "open-ticket.github.io"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "www_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "www"
  type    = "CNAME"
  value   = "mbellgb.github.io"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "mx_mbell_me" {
  zone_id  = cloudflare_zone.mbell_me.id
  name     = "mbell.me"
  type     = "MX"
  value    = "aspmx.l.google.com"
  priority = 1
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "mx_alt_mbell_me" {
  count    = 4
  zone_id  = cloudflare_zone.mbell_me.id
  name     = "mbell.me"
  type     = "MX"
  value    = "alt${count.index + 1}.aspmx.l.google.com"
  priority = 5 * (count.index + 1)
  ttl      = var.dns_record_ttl
}

resource "cloudflare_record" "txt_google_site_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "mbell.me"
  type    = "TXT"
  value   = "google-site-verification=1TVRPSOrcCR5EMwP_LY96-GbqSOo4-gUkcdik-r0-Zo"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "txt_keybase_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "mbell.me"
  type    = "TXT"
  value   = "keybase-site-verification=5DbkKJphBL_WTuY8oGz4ioKtvWorhbpbBYyZzTRbuw0"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "txt_mg_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "mg"
  type    = "TXT"
  value   = "v=spf1 include:mailgun.org ~all"
  ttl     = var.dns_record_ttl
}

resource "cloudflare_record" "txt_domainkey_mx_mbell_me" {
  zone_id = cloudflare_zone.mbell_me.id
  name    = "mx._domainkey.mg"
  type    = "TXT"
  value   = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDGZxUEsq6rWpHKHMkX4pbei5PBHd98OtlhVV2G8yUp8+bWqGgx+u0jehjJtCGu34IQuUXFLHEIDKCz2buJM87BAUy0/acTNhbR0DAXzb91JkdkI62lfI1Ds41kOgHfjTcnPmHfNe22jAZOeKXZkbQokVkhBj0LygMC07yeLSlZdwIDAQAB"
  ttl     = var.dns_record_ttl
}
