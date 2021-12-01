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
PM2 is a production process manager for Node.js applications with a built-in load balancer. It allows you to keep applications alive forever, to reload them without downtime and to facilitate common system admin tasks. You can read more about pm2.
Or in your package.json file, configure the start section like --
```js
{
  "scripts": {
    "start": "pm2-runtime start ecosystem.config.js --env production"
  }
}
```
# or 

```js
npm install pm2 -g
sudo pm2 start app.js
sudo pm2 startup
```
