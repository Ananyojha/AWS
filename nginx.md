## di digital ocean
```
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
```






```sh
mkdir /var/www/tutorial
git clone https://github.com/Ananyojha/ananyojha.github.io.git --bare
touch /etc/nginx/sites-enabled/tutorial

```
## in sites enabled
```sh
server {
       listen 80;
       listen [::]:80;

       server_name ananay.nginx.com;

       root /var/www/tutorial;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}
```

```sh
sudo service nginx restart
```
