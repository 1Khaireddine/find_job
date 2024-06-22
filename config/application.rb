require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FindJob
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.generators do |g|
      g.template_engine :haml
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    LetterOpener.configure do |config|
      # To overrider the location for message storage.
      # Default value is `tmp/letter_opener`
      config.location = Rails.root.join('tmp', 'my_mails')

      # To render only the message body, without any metadata or extra containers or styling.
      # Default value is `:default` that renders styled message with showing useful metadata.
      config.message_template = :light
    end
  end
end
