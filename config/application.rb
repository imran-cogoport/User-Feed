require_relative "boot"

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    services = Dir.glob(Rails.root.join('services/*')).map { |service| service.split('services/').last }

    directories = %w[interactions models]

    services.each do |service|
      config.eager_load_paths += Dir.glob(Rails.root.join(service))
      directories.each do |directory|
        config.eager_load_paths += Dir.glob(Rails.root.join("services/#{service}/#{directory}"))
      end
    end
  end
end
