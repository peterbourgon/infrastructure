#!/bin/sh

read -p "DigitalOcean token: " do_token
if [ -z "$do_token" ]
then
	echo token is required
	exit 1
fi

default_private_key_file="$HOME/.ssh/id_rsa"
read -p "Path to your SSH key [${default_private_key_file}]: " private_key_file
private_key_file=${private_key_file:-$default_private_key_file}
if [ ! -f $private_key_file ]
then
	echo $private_key_file not found
	exit 1
fi

default_public_key_file="${private_key_file}.pub"
read -p "Path to your public SSH key [${default_public_key_file}]: " public_key_file
public_key_file=${public_key_file:-$default_public_key_file}
if [ ! -f $public_key_file ]
then
	echo $public_key_file not found
	exit 1
fi

key_fingerprint=$(ssh-keygen -lf $public_key_file | awk '{print $2}')
vars_file="terraform.tfvars"
authorized_keys_file="authorized_keys"

cat >$vars_file <<EOF
ssh_key_file = "$private_key_file"
ssh_fingerprint = "$key_fingerprint"
authorized_keys_file = "$authorized_keys_file"
do_token = "$do_token"
EOF

cp $public_key_file $authorized_keys_file

echo ; cat $vars_file
echo ; cat $authorized_keys_file
