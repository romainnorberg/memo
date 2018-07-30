# Heroku

## :bulb: Tips

### ssh access
$ `heroku run bash --app=<app-name>`

### acces logs
$ `heroku logs --ps web.1 --app=<app-name>`

### install VIM
```
mkdir ~/vim
cd ~/vim
curl 'https://s3.amazonaws.com/bengoa/vim-static.tar.gz' | tar -xz
export VIMRUNTIME="$HOME/vim/runtime"
export PATH="$HOME/vim:$PATH"
cd -
```

### force push to deploy specific branch
```
git remote add preprod https://git.heroku.com/project-preprod.git
git push preprod <specific-branch>:master -f
```

### update/add env. var from file
`heroku config:set GOOGLE_SQL_PROXY_KEY="$(< /my/key_file.json)"  --app=xxxx-preprod`

### [Add-on] Papertrail

#### Log filters (settings > log filters)

Doc: https://help.papertrailapp.com/kb/how-it-works/log-filtering/#create-filter
Validate expression: http://rubular.com/

Example: 

```
Apr 30 05:56:35 xxxx-app-name heroku/router: at=info method=GET path="/" host=xxxx-host request_id=6b29855f-e8b5-43c1-8ee0-28221c9c8763 fwd="193.70.41.33" dyno=web.1 connect=0ms service=2ms status=200 bytes=358 protocol=https 
...
Apr 29 23:20:38 xxxx-app-name heroku/router: at=error code=H12 desc="Request timeout" method=GET path="/project/xxxxxx" host=xxxx-host request_id=2a510c34-4c62-4613-87d1-c6741ab0eb1f fwd="85.201.168.188" dyno=web.5 connect=2ms service=30000ms status=503 bytes=0 protocol=https
...
Apr 30 06:05:03 xxxx-app-name app/web.3: 10.86.164.34 - - [30/Apr/2018:15:05:02 +0200] "GET /signin HTTP/1.1" 301 5263 "-" "Pingdom.com_bot_version_1.4_(http://www.pingdom.com/) 
```

- Exlude info _(regex mode)_: `heroku\/router: at=(info)` 
- Exclude info BUT only for < 30000ms response time _(regex mode)_: `heroku\/router: at=(info) (.*) service=(([1|2][0-9]{0,4})|([1-9][0-9]{0,3}))ms (.*)` (regex permalink: http://rubular.com/r/NlKGJlZR7Y)
- ...
