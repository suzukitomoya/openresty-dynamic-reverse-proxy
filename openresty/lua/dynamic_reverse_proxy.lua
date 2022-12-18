local redis = require "resty.redis"

local redis_client = redis:new()
redis_client:set_timeouts(1000, 1000, 1000)

local ok, err = redis_client:connect("redis", 6379)
if not ok then
    ngx.log(ngx.ERR, "Redis connection error: ", err)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end

local result, err = redis_client:hmget(ngx.var.host, "upstream")
if result[1] == ngx.null then
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

ngx.var.upstream = result[1]
