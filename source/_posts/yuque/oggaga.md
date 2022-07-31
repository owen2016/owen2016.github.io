---
title: 前后端常见鉴权方式
urlname: oggaga
date: '2021-03-31 18:50:23 +0800'
tags: []
categories: []
---

目前我们常用的鉴权有四种：

1. **HTTP Basic Authentication**
1. **session-cookie**
1. **Token 验证**
1. **OAuth(开放授权)**



## 一. HTTP Basic Authentication

这种授权方式是浏览器遵守 http 协议实现的基本授权方式,HTTP 协议进行通信的过程中，HTTP 协议定义了基本认证认证允许 HTTP 服务器对客户端进行用户身份证的方法。 
认证过程： 
  1． 客户端向服务器请求数据，请求的内容可能是一个网页或者是一个 ajax 异步请求，此时，假设客户端尚未被验证，则客户端提供如下请求至服务器: 
  Get /index.html HTTP/1.0
  Host:www.google.com

2． 服务器向客户端发送验证请求代码 401,（WWW-Authenticate: Basic realm=”google.com”这句话是关键，如果没有客户端不会弹出用户名和密码输入界面）服务器返回的数据大抵如下： 
` HTTP/1.0 401 Unauthorised`
` Server: SokEvo/1.0`
` WWW-Authenticate: Basic realm=”google.com”`
` Content-Type: text/html`
` Content-Length: xxx`

3． 当符合 http1.0 或 1.1 规范的客户端（如 IE，FIREFOX）收到 401 返回值时，将自动弹出一个登录窗口，要求用户输入用户名和密码。

4． 用户输入用户名和密码后，将用户名及密码以 BASE64 加密方式加密，并将密文放入前一条请求信息中，则客户端发送的第一条请求信息则变成如下内容： 
` Get /index.html HTTP/1.0`
` Host:www.google.com`
` Authorization: Basic d2FuZzp3YW5n`

注：d2FuZzp3YW5n 表示加密后的用户名及密码（用户名：密码 然后通过 base64 加密，加密过程是浏览器默认的行为，不需要我们人为
加密，我们只需要输入用户名密码即可）

5． 服务器收到上述请求信息后，将 Authorization 字段后的用户信息取出、解密，将解密后的用户名及密码与用户数据库进行比较验证，如用户名及密码正确，服务器则根据请求，将所请求资源发送给客户端



** 效果：**  客户端未未认证的时候，会弹出用户名密码输入框，这个时候请求时属于 pending 状态，这个时候其实服务当用户输入用户名密码的时候客户端会再次发送带 Authentication 头的请求
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1617206638312-29a03c43-8660-4b20-b9f6-cf56fb9a5b01.png#crop=0&crop=0&crop=1&crop=1&height=258&id=GUiMW&margin=%5Bobject%20Object%5D&name=image.png&originHeight=258&originWidth=879&originalType=binary∶=1&rotation=0&showTitle=false&size=23650&status=done&style=none&title=&width=879)
**认证成功：**

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1617206673617-45804899-5264-4bb4-ab8d-af1e960a5809.png#crop=0&crop=0&crop=1&crop=1&height=362&id=jo9Nr&margin=%5Bobject%20Object%5D&name=image.png&originHeight=362&originWidth=635&originalType=binary∶=1&rotation=0&showTitle=false&size=62578&status=done&style=none&title=&width=635)
**server.js**
`let express = require("express");`
`let app = express();`

` app.use(express.static(__dirname+'/public'));`

` app.get("/Authentication_base",function(req,res){`
` console.log('req.headers.authorization:',req.headers)`
` if(!req.headers.authorization){`
` res.set({`
` 'WWW-Authenticate':'Basic realm="wang"'`
` });`
` res.status(401).end();`
` }else{`
` let base64 = req.headers.authorization.split(" ")[1];`
` let userPass = new Buffer(base64, 'base64').toString().split(":");`
` let user = userPass[0];`
` let pass = userPass[1];`
` `` if(user=="wang"&&pass="wang"){`
` res.end("OK");`
` }else{`
` res.status(401).end();`
` }`
` }`
` })`

` app.listen(9090)`

**index.html**
`<!DOCTYPE html>`
`<html>`
` <head>`
` <meta charset="UTF-8">`
` <title>HTTP Basic Authentication</title>`
` </head>`
` <body>`
` <div></div>`
` <script src="js/jquery-3.2.1.js"></script>`
` <script>`
` $(function(){`
` send('./Authentication_base');`
` })`
` var send = function(url){`
` $.ajax({ `
` url : url, `
` method : 'GET', `
` });`
` }`
` </script>`
` </body>`
`</html>`

这种验证方式的缺陷加密方式简单，仅仅是 base64 加密，这种加密方式是可逆的。同时在每个请求的头上都会附带上用户名和密码信息，这样在外网是很容易被嗅探器探测到的。
正式因为这样，这种加密方式一般多被用在内部安全性要求不高的的系统上，只是相对的多，总的来说现在使用这种鉴权比较少了。如果项目需要部署在公网上，这种方式不推荐

## 二. session-cookie

第二种这个方式是利用服务器端的 session（会话）和浏览器端的 cookie 来实现前后端的认证，由于 http 请求时是无状态的，服务器正常情况下是不知道当前请求之前有没有来过，这个时候我们如果要记录状态，就需要在服务器端创建一个会话(seesion),将同一个客户端的请求都维护在各自得会会话中，每当请求到达服务器端的时候，先去查一下该客户端有没有在服务器端创建 seesion，如果有则已经认证成功了，否则就没有认证。

**session-cookie 认证主要分四步：**

1. 服务器在接受客户端首次访问时在服务器端创建 seesion，然后保存 seesion(我们可以将 seesion 保存在内存中，也可以保存在 redis 中，推荐使用后者)，然后给这个 session 生成一个唯一的标识字符串,然后在响应头中种下这个唯一标识字符串。
1. 签名。这一步只是对 sid 进行加密处理，服务端会根据这个 secret 密钥进行解密。（非必需步骤）
1. 浏览器中收到请求响应的时候会解析响应头，然后将 sid 保存在本地 cookie 中，浏览器在下次 http 请求 de 请求头中会带上该域名下的 cookie 信息，
1. 服务器在接受客户端请求时会去解析请求头 cookie 中的 sid，然后根据这个 sid 去找服务器端保存的该客户端的 session，然后判断该请求是否合法

![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1617207070670-90c14816-aca3-4f6a-a97c-9355c5f6417c.png#crop=0&crop=0&crop=1&crop=1&height=464&id=xmdyK&margin=%5Bobject%20Object%5D&name=image.png&originHeight=464&originWidth=777&originalType=binary∶=1&rotation=0&showTitle=false&size=38976&status=done&style=none&title=&width=777)
server.js(nodejs+express+seesion+redis)

`var express = require('express');`
`var RedisStore = require('connect-redis')(express.session);`
`var app = express();`
`var secret = "wang839305939"`
`// 设置 Cookie`
`app.use(express.cookieParser(secret));`

`// 设置 Session`
`app.use(express.session({`
` store: new RedisStore({`
` host: "127.0.0.1",`
` port: 6379,`
` db: "session_db"`
` }),`
` secret: secret`
`}))`

`app.get("/", function(req, res) {`
` var session = req.session;`
` session.time= session.time|| 0;`
` var n = session.time++;`
` res.send('hello, session id:' + session.id + ' count:' + n);`
`});`

`app.listen(9080);`

## 三.Token 验证

使用基于 Token 的身份验证方法，大概的流程是这样的：

1. 客户端使用用户名跟密码请求登录
 2. 服务端收到请求，去验证用户名与密码
 3. 验证成功后，服务端会签发一个 Token，再把这个 Token 发送给客户端
 4. 客户端收到 Token 以后可以把它存储起来，比如放在 Cookie 里或者 Local Storage 里
 5. 客户端每次向服务端请求资源的时候需要带着服务端签发的 Token
 6. 服务端收到请求，然后去验证客户端请求里面带着的 Token，如果验证成功，就向客户端返回请求的数据

总的来说就是客户端在首次登陆以后，服务端再次接收 http 请求的时候，就只认 token 了，请求只要每次把 token 带上就行了，服务器端会拦截所有的请求，然后校验 token 的合法性，合法就放行，不合法就返回 401（鉴权失败）。

乍的一看好像和前面的 seesion-cookie 有点像，seesion-cookie 是通过 seesionid 来作为浏览器和服务端的链接桥梁，而 token 验证方式貌似是 token 来起到 seesionid 的角色。其实这两者差别是很大的。

1. sessionid 他只是一个唯一标识的字符串，服务端是根据这个字符串，来查询在服务器端保持的 seesion，这里面才保存着用户的登陆状态。但是 token 本身就是一种登陆成功凭证，他是在登陆成功后根据某种规则生成的一种信息凭证，他里面本身就保存着用户的登陆状态。服务器端只需要根据定义的规则校验这个 token 是否合法就行。

2. session-cookie 是需要 cookie 配合的，居然要 cookie，那么在 http 代理客户端的选择上就是只有浏览器了，因为只有浏览器才会去解析请求响应头里面的 cookie,然后每次请求再默认带上该域名下的 cookie。但是我们知道 http 代理客户端不只有浏览器，还有原生 APP 等等，这个时候 cookie 是不起作用的，或者浏览器端是可以禁止 cookie 的(虽然可以，但是这基本上是属于吃饱没事干的人干的事)…，但是 token 就不一样，他是登陆请求在登陆成功后再请求响应体中返回的信息，客户端在收到响应的时候，可以把他存在本地的 cookie,storage，或者内存中，然后再下一次请求的请求头重带上这个 token 就行了。简单点来说 cookie-session 机制他限制了客户端的类型，而 token 验证机制丰富了客户端类型。

3. 时效性。session-cookie 的 sessionid 实在登陆的时候生成的而且在登出事时一直不变的，在一定程度上安全就会低，而 token 是可以在一段时间内动态改变的。
4. 可扩展性。token 验证本身是比较灵活的，一是 token 的解决方案有许多，常用的是 JWT, 二来我们可以基于 token 验证机制，专门做一个鉴权服务，用它向多个服务的请求进行统一鉴权。

因为 jwt 的 payload 携带了过期时间、用户信息等，所以 JWT 有别于传统 Session 方案的一个最大不同就是 JWT 是无状态的，JWT 不用在内存或 DB 里维持 session 的状态，直接拿到 token 解析就可以了

下面就拿最常用的 JWT（**JSON WEB TOKEN**）来说：

**JWT 是 Auth0 提出的通过对 JSON 进行加密签名来实现授权验证的方案**，就是登陆成功后将相关信息组成 json 对象，然后对这个对象进行某中方式的加密，返回给客户端，客户端在下次请求时带上这个 token，服务端再收到请求时校验 token 合法性，其实也就是在校验请求的合法性。
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1617240352266-494610c4-eb86-4a57-86ed-0993c71238d8.png#crop=0&crop=0&crop=1&crop=1&height=455&id=lrDXE&margin=%5Bobject%20Object%5D&name=image.png&originHeight=455&originWidth=699&originalType=binary∶=1&rotation=0&showTitle=false&size=183228&status=done&style=none&title=&width=699)
**JWT 对象通常由三部分构成：**
Headers： 包括类别（typ）、加密算法（alg）
   {
     "alg": "HS256",
     "typ": "JWT"
   }

Playload：包括需要传递的用户信息
   {
     "sub": "1234567890",
     "name": "John Doe",
     "admin": true
   }

Signature： 根据 alg 算法与私有秘钥进行加密得到的签名字串， 这一段是最重要的敏感信息，只能在服务端解密；
HMACSHA256(  
   base64UrlEncode(Headers) + "." +
   base64UrlEncode(Claims),
   SECREATE_KEY
)

_**编码之后的 JWT 看起来是这样的一串字符：**_
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ

nodejs+express+jwt-simple

**auth.js**
`let jwt = require('jwt-simple');`
`let secret = "wangyy";`
`let time = 10;`
`module.exports = {`
` /*`
` *检验token合法性`
`*/`
`validate:function(req,res,next){`
` let token = req.body.token||req.headers["xssToken"];`
` if(token){`
` let decodeToken = null;`
` try { //防止假冒token解析報錯`
` decodeToken = jwt.decode(token,secret,'HS256');`
` } catch (err) {`
` res.status(401).send("非法访问"); return;`
` }`
` let exp = decodeToken.exp; if(!exp){`
` res.status(401).send("非法访问");`
` }`
` let now = new Date().getTime();`
` if(exp>(now+time*60*1000)){`
` res.send({code:'002',"errorMsg":"授权超时"})`
` }`
` next();`
` }else{`
` res.status(401).send("非法访问");`
` }`
` },`
` /* 生成token*/`
` ``**makeToken**``(``){`
` let Token = null;`
` let payload = {`
` time:new Date().getTime(),`
` exp:this.makeExp(time)`
` }`
` Token = jwt.encode(payload,secret,HS256) return Token;`
`},`
`/*生成token过期时间*/`
` makeExp:function(time){`
` let stam = time601000;`
` }`
` }`

**server.js**
`let express = require("express"); `
`let app = express(); `
`let bodyParser = require('body-parser'); `
`let auth = require('./lib/auth.js'); `
`let chalk = require('chalk'); app.use(bodyParser.json()); app.post('/login',function(req,res,next){ `
` `` let Token = auth.makeToken();`
` res.json({result:"success",token:Token},200)`
` });`
`app.use('*',[auth.validate],function(req,res,next){ `
` res.send('success');`
` });`
`app.listen('9999')`

上面只是一个简单的 token 生成和校验，如果有需要可以根据实际需要进行逻辑处理

## 四. OAuth(开放授权)

OAuth（开放授权）是一个开放标准，允许用户授权第三方网站访问他们存储在另外的服务提供者上的信息，而不需要将用户名和密码提供给第三方网站或分享他们数据的所有内容，为了保护用户数据的安全和隐私，第三方网站访问用户数据前都需要显式的向用户征求授权。我们常见的提供 OAuth 认证服务的厂商有支付宝，QQ,微信。
 OAuth 协议又有 1.0 和 2.0 两个版本。相比较 1.0 版，2.0 版整个授权验证流程更简单更安全，也是目前最主要的用户身份验证和授权方式。

下面是一张 auth2.0 的流程图：
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1617207922357-98ac52a6-e990-4986-ad47-d1706099db44.png#crop=0&crop=0&crop=1&crop=1&height=322&id=ZQ7eI&margin=%5Bobject%20Object%5D&name=image.png&originHeight=322&originWidth=625&originalType=binary∶=1&rotation=0&showTitle=false&size=55213&status=done&style=none&title=&width=625)
从图中我们可以看出，auth2.0 流程分为六布（我们就以 csdn 登陆为例）：

**第一步**. 向用户请求授权，现在很多的网站在登陆的时候都有第三方登陆的入口，当我们点击等第三方入口时，第三方授权服务会引导我们进入第三方登陆授权页面
![image.png](https://cdn.nlark.com/yuque/0/2021/png/5374140/1617208008626-6c67f364-18b2-4a40-a0c5-9be9fb900fa1.png#crop=0&crop=0&crop=1&crop=1&height=194&id=a6T3r&margin=%5Bobject%20Object%5D&name=image.png&originHeight=194&originWidth=503&originalType=binary∶=1&rotation=0&showTitle=false&size=26766&status=done&style=none&title=&width=503)

通过第三方请求授权页面的浏览器地址栏地址可以看出，

[https://graph.qq.com/oauth2.0/show?which=Login&display=pc&response_type=code&client_id=100270989&redirect_uri=https%3A%2F%2Fpassport.csdn.net%2Faccount%2Flogin%3Foauth_provider%3DQQProvider&state=test](https://graph.qq.com/oauth2.0/show?which=Login&display=pc&response_type=code&client_id=100270989&redirect_uri=https%253A%252F%252Fpassport.csdn.net%252Faccount%252Flogin%253Foauth_provider%253DQQProvider&state=test)

这里的地址里面的%是浏览器强制编码后的显示,我们可以使用 decodeURIComponent 进行解码，解码后是这样：

[https://graph.qq.com/oauth2.0/show?which=Login&display=pc&response_type=code&client_id=100270989&redirect_uri=https://passport.csdn.net/account/login?oauth_provider=QQProvider&state=test](https://graph.qq.com/oauth2.0/show?which=Login&display=pc&response_type=code&client_id=100270989&redirect_uri=https://passport.csdn.net/account/login?oauth_provider=QQProvider&state=test)

这个 url 地址我们可以看见 Auth2.0 常见的几个参数：

- response_type，返回类型
- client_id，第三方应用 id,由授权服务器（qq）在第三方应用提交时颁发给第三方应用。
- redirect_uri，登陆成功重定向页面
- oauth_provider，第三方授权提供方
- state，由第三方应用给出的随机码

**第二步**. 返回用户凭证（code），并返回一个凭证（code），当用户点击授权并登陆后，授权服务器将生成一个用户凭证（code）。这个用户凭证会附加在重定向的地址 redirect_uri 的后面

[https://passport.csdn.net/account/login?code=9e3efa6cea739f9aaab2&state=XXX](https://passport.csdn.net/account/login?code=9e3efa6cea739f9aaab2&state=XXX)

第 3 步. 请求授权服务器授权:

经过第二部获取 code 后后面的工作就可以交给后台去处理的，和用户的交互就结束了。接下来需要获取 Access Token，我们需要用他来向授权服务器获取用户信息等资源。
第三方应用后台通过第二步的凭证（code）向授权服务器请求 Access Token，这时候需要以下几个信息：

- client_id 标识第三方应用的 id，由授权服务器（Github）在第三方应用提交时颁发给第三方应用
- client_secret 第三方应用和授权服务器之间的安全凭证，由授权服务器（Github）在第三方应用提交时颁发给第三方应用
- code 第一步中返回的用户凭证 redirect_uri 第一步生成用户凭证后跳转到第二步时的地址
- state 由第三方应用给出的随机码

第四步. 授权服务器同意授权后，返回一个资源访问的凭证（Access Token）。

第五步. 第三方应用通过第四步的凭证（Access Token）向资源服务器请求相关资源。

第六步. 资源服务器验证凭证（Access Token）通过后，将第三方应用请求的资源返回。

从用户角度来说，第三方授权可以让我们快速的登陆应用，无需进行繁琐的注册,同时不用记住各种账号密码。只需要记住自己常用的几个账号就 ok 了。
从产品经理的角度来所，这种授权方式提高用户的体验满意度。另一方面可以获取更多的用户。

## 总结：

授权方式多种多样，主要还是要取决于我们对于产品的定位。如果我们的产品只是在企业内部使用，token 和 session 就可以满足我们的需求，如果是面向互联网的大众用户，那么第三方授权在用户体验度上会有一个很大的提升
