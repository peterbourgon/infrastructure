# Infrastructure

My servers, let me show you them.

## Usage

Get yourself a [Digital Ocean](http://digitalocean.com)
and a [Terraform](http://terraform.io)
and a [CloudFlare](https://cloudflare.com).
Then, set up your secrets.

```
$ ./generate.sh
DigitalOcean token: a0b1c2d3e4f5
Path to your SSH key [/Users/peter/.ssh/id_rsa]:
Path to your public SSH key [/Users/peter/.ssh/id_rsa.pub]:
CloudFlare email: peter@computermail.org
CloudFlare token: a0b1c2d3e4f5
CloudFlare domain: internet.website
```

Register the modules with Terraform.

```
$ terraform get
```

Check your plan.

```
$ terraform plan
```

Engage.

```
$ terraform apply
```

