require_relative 'boot'

require 'rails/all'
require 'google_drive'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Owt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    config.hosts << "6e9412cf6bb342f7bc538a84417dd0fc.vfs.cloud9.us-east-1.amazonaws.com"
    config.hosts << "overwatch-tranquility.herokuapp.com"
    config.hosts << "www.owtranquility.org"
    config.hosts << "owtranquility.org"
    config.active_job.queue_adapter = :sidekiq
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end