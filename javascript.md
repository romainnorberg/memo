# Javascript

## Date 

### Date manipulation

#### Add 30 days
```
var dateCookie = new Date();
dateCookie.setDate(dateCookie.getDate() + 30); 
console.log(dateCookie);
```

#### Add 3 months
```
var dateCookie = new Date();
dateCookie.setMonth(dateCookie.getMonth()+3);
console.log(dateCookie);
```

#### Get difference between 2 dates (in seconds)
```
var dateCookie = new Date();
dateCookie.setMonth(dateCookie.getMonth()+3);
var dateCookieExpiration = (Math.round(dateCookie.getTime() - (new Date().getTime())) / 1000); 
console.log(dateCookieExpiration);
```
