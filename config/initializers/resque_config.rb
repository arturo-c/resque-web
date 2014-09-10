config = ENV.fetch("RAILS_RESQUE_REDIS", "127.0.0.1:6379")
Resque.redis = config

# Have to do this to accept password because resque does not support
# setting it in the string.
password = ENV.fetch("RAILS_RESQUE_REDIS_PASSWORD", nil)
unless password.nil?
  opts = Resque.redis.client.options
  redis = Redis.new(opts.merge(:password => password))
  Resque.redis = redis
end
