# Infrastructure

My servers, let me show you them.

## Usage

Get yourself a [Digital Ocean](http://digitalocean.com)
and a [Terraform](http://terraform.io).
Then, set up your secrets.

```
$ ./generate.sh
DigitalOcean token: a0b1c2d3e4f5
Path to your SSH key [/Users/peter/.ssh/id_rsa]:
Path to your public SSH key [/Users/peter/.ssh/id_rsa.pub]:

ssh_key_file = "/Users/peter/.ssh/id_rsa"
ssh_fingerprint = "00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00"
authorized_keys_file = "authorized_keys"
do_token = "a0b1c2d3e4f5"

ssh-rsa AAAAABCdef peter@computer
```

To get the key ID (fingerprint),

```
$ ssh-keygen -lf $HOME/.ssh/id_rsa.pub
```

Check your plan.

```
$ terraform plan
```

Engage.

```
$ terraform apply
```
