#!/usr/bin/env bash
sudo docker stop scwf 2>/dev/null
sudo docker rm scwf 2>/dev/null
git clone https://github.com/DaWouw/SCWF.git 2>/dev/null

# Docker
sudo docker run -d -p 80:80 -v $(pwd)/SCWF:/usr/local/apache2/htdocs/:Z --name scwf --restart unless-stopped -d httpd

### Behind Traefik
#sudo docker run --label traefik.enable=true --label traefik.frontend.headers.SSLRedirect=true --label traefik.backend=scwf --label traefik.frontend.rule=Host:scwf.example.com --label traefik.port=80 --net web -v $(pwd)/SCWF:/usr/local/apache2/htdocs/:Z  --name scwf --restart unless-stopped -d httpd
