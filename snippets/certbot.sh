certbot certonly --dns-cloudflare --dns-cloudflare-credentials ~/.secrets/cloudflare.ini --server https://acme-v02.api.letsencrypt.org/directory --email lollipop.studio.cn@gmail.com --agree-tos --no-eff-email -d '*.ndoskrnl.net'
sudo rsync -rlt -P --no-owner --no-group --no-perms $(sudo readlink -f /etc/letsencrypt/live/ndoskrnl.net/{fullchain,privkey}.pem| tr '\n' ' ') ~/docker/xray/
