Sidekiq.configure_server do |config|
  config.redis = {
    url: 'redis://redis:6379/0'
  }
  config.average_scheduled_poll_interval = 5
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: 'redis://redis:6379/0'
  }
end
