require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.secrets.sidekiq_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.secrets.sidekiq_url }
end

unless Rails.env.development?
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|

    [user, password] == [Rails.application.secrets.sidekiq_username,
                         Rails.application.secrets.sidekiq_password]
  end
end
