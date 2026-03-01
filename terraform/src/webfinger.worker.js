const domain = "mbell.dev"
async function handleRequest(request) {
  const url = new URL(request.url)
  const key = url.searchParams.get('resource')
  if (key == null) {
    return new Response('resource required', {
      status: 400
    })
  }
  const email = key.replace("acct:", "")
  if (! /([A-Za-z0-9+]|-)+@mbell.dev/.match(email)) {
    return new Response('', {
      status: 400
    })
  }

  const res = {
    subject: `acct:${email}`,
    links: [
      {
        rel: "http://openid.net/specs/connect/1.0/issuer",
        href: "https://login.maisie.dog"
      }
    ]
  }
  return new Response(JSON.stringify(res), {
    headers: {
      'content-type': 'application/json'
    }
  })

}

addEventListener('fetch', async event => {
  event.respondWith(handleRequest(event.request))
})
