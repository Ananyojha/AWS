## Install node js
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
node -- version
npm -v
npm install aws-sdk
``` 
## install git
```bash
sudo yum upgrade -y
sudo yum install git
```

## Install db migrate 
```js
npm install -g db-migrate
```

## keep your node app running

```js
npm install pm2 -g
sudo pm2 start app.js
sudo pm2 startup
```
