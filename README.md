# test-jenkins
just testing my jenkins server
I commit and push and jenkin will do the tests

## copy these lines in shell excecute section during build in jerkins config
```
npm install
./node_modules/.bin/pm2 start app.js
./node_modules/mocha/bin/mocha

```
