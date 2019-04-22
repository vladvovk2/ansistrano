Redis.current = Redis.new(host: :redis, port: 6379)
current_redis = { host: :redis, port: 6379, db: 12 }

Sidekiq.configure_server do |config|
  config.redis = current_redis
end

Sidekiq.configure_client do |config|
  config.redis = current_redis
end
