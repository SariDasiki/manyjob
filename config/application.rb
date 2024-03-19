require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RailsFunctionsTaskApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.active_job.queue_adapter = :sidekiq
    
    config.load_defaults 6.0
    config.i18n.default_locale= :ja
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end

