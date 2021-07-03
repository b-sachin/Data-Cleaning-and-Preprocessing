library(httr)
library(httpuv)
library(jsonlite)

# 1. Find OAuth settings for github:
#    https://github.com/settings/developers

oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.


myapp <- oauth_app("github",
                   key = "2d30acea0a4565435ef7",
                   secret = "b81d5bdaee9af84544768b94b9008440c8cadaf4"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
###content(req)

# OR:

### req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
### stop_for_status(req)
### content(req)

# 5. Convert req file into dataframe

 json1=content(req)
 json2=jsonlite::fromJSON(toJSON(json1))
 
# 6. Answer for "time that 'datasharing' repo was created" 

 res<-json2$name=="datasharing"
 
json2[res,c("name","created_at")]
 