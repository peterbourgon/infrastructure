#!/usr/bin/env fish

set host microweb.us-west1-b.professor-wiggles

echo if this appears to stall, try: gcloud compute config-ssh

./gcp_root.fish $host
./gcp_user.fish $host
./gcp_webserver.fish $host
