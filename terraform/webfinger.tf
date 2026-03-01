resource "cloudflare_worker_script" "webfinger_handler" {
  name    = "webfinger"
  content = file("./src/webfinger.worker.js")
}

resource "cloudflare_worker_route" "webfinger" {
  zone_id     = cloudflare_zone.mbell_dev.id
  pattern     = "mbell.dev/.well-known/webfinger"
  script_name = cloudflare_worker_script.webfinger_handler.name
}
