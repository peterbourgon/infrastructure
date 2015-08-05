# Infrastructure

My servers, let me show you them.

## Usage

Get yourself a [Digital Ocean](http://digitalocean.com)
and a [Terraform](http://terraform.io).
Then, set up your secrets.

```
$ cat terraform.tfvars
ssh_key_path = "/home/yourname/.ssh/id_rsa"
ssh_key_id = "12:34:56:78:9a:bc:de:f0:12:34:56:78:9a:bc:de:f0"
do_token = "000000000000000000000000000000000000000000000000000000000000000f"

$ cat authorized_keys
ssh-rsa AAAAAAAAAAAA/etc hostname
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

