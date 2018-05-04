require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StartKit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Beijing'
    config.encoding = "utf-8"
    config.active_record.schema_format = :ruby
    config.eager_load_paths += Dir["#{config.root}/lib/"]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]

    # config.active_job.queue_adapter = :sidekiq

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.filter_parameters << :password

    # config.middleware.use Rack::Attack
  end
end
