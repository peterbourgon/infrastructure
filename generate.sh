#!/bin/sh

read -p "DigitalOcean token: " do_token
if [ -z "$do_token" ]
then
	echo "token is required"
	exit 1
fi

default_public_key_file="$HOME/.ssh/id_rsa.pub"
read -p "Path to your public SSH key [${default_public_key_file}]: " public_key_file
public_key_file=${public_key_file:-$default_public_key_file}
if [ ! -f $public_key_file ]
then
	echo "$public_key_file not found"
	exit 1
fi


read -p "CloudFlare email: " cloudflare_email
if [ -z "$cloudflare_email" ]
then
	echo "email is required"
	exit 1
fi

read -p "CloudFlare token: " cloudflare_token
if [ -z "$cloudflare_token" ]
then
	echo "token is required"
	exit 1
fi

read -p "CloudFlare domain: " cloudflare_domain
if [ -z "$cloudflare_domain" ]
then
	echo "domain is required"
	exit 1
fi

vars_file="terraform.tfvars"

cat >$vars_file <<EOF
do_token          = "$do_token"
ssh_public_key    = "$public_key_file"
cloudflare_email  = "$cloudflare_email"
cloudflare_token  = "$cloudflare_token"
cloudflare_domain = "$cloudflare_domain"
EOF

echo ; cat $vars_file
