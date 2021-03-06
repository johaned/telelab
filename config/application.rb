require File.expand_path('../boot', __FILE__)

require 'rails/all'


#Additional libraries
require "net/http"

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Telelab02
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
    
    # NEW! -- good and not so good when plugins have Singleton classes
    #config.autoload_paths += %W(#{config.root}/lib)
    #config.autoload_paths += Dir["#{config.root}/lib/**/"]
    #config.autoload_paths += Dir["#{config.root}/lib/serial"]



    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # JavaScript files you want as :defaults (application.js is always included).
    config.action_view.javascript_expansions[:defaults] = %w(jquery-1.7.min rails jquery-ui-1.8.16.custom.min)

    config.action_view.javascript_expansions[:jquery] = %w(jquery-1.7.min)
    config.action_view.javascript_expansions[:jquery_ui] = %w(jquery-ui-1.8.16.custom.min)

    config.action_view.javascript_expansions[:jquery_datatables] = %w(jquery.dataTables.1.8.0.min)
    config.action_view.javascript_expansions[:jquery_tokeninput] = %w(jquery.tokeninput.1.6.0)
    #config.action_view.javascript_expansions[:jquery_tooltip] = %w(jquery.simpletip-1.3.1.min)


    #STYLESHEETS

    config.action_view.stylesheet_expansions[:defaults] = %w(jquery-ui-1.8.16.custom screen)
    config.action_view.stylesheet_expansions[:jquery_ui] = %w(jquery-ui-1.8.16.custom)
    #config.action_view.stylesheet_expansions[:jquery_datatables] = %w(jquery.dataTables.1.8.0.min.js)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
  end
end

require 'env_yaml'
