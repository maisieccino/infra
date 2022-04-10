#!/bin/bash -e
email_header="X-Auth-Email: ${CF_EMAIL}"
auth_header="X-Auth-Key: ${CF_TOKEN}"
echo -n "Enter zone ID: "
read -r zone_id
curl \
	-H "${auth_header}" \
	-H "${email_header}" \
	"https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records" \
	| jq '.result | map({id: .id, name: .name, type: .type})' | jq -c ".[]" >/tmp/zones
while read -r zone </tmp/zones; do
	id=$(jq -r .id <<< "$zone")
	name=$(jq -r .name <<< "$zone")
	type=$(jq -r .type <<< "$zone")
	echo "Terraform resource for ${name} - ${type}:"
	read resource </dev/tty
	terraform import "${resource}" "${zone_id}/${id}"
