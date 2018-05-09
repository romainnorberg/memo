# Terminal / Curl

## :bulb: Tips

### Lookup time

$ `curl -s -w '\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nAppCon time:\t%{time_appconnect}\nRedirect time:\t%{time_redirect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\n\nTotal time:\t%{time_total}\n' -o /dev/null http://www.shellhacks.com`
```
Lookup time:	0.255184
Connect time:	0.372691
AppCon time:	0.000000
Redirect time:	0.000000
PreXfer time:	0.372778
StartXfer time:	0.491763

Total time:	0.491837
```
