Telelab02::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local = true
  config.action_view.debug_rjs = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  #SOLUTION for Missing host to link to! Please provide :host parameter or set default_url_options[:host]
  # This assumes you're running your local development server on port 3000 via script/server
  #config.action_mailer.default_url_options = {:host => 'localhost:3000'}
  config.action_mailer.default_url_options = {:host => '192.168.0.100:3000'}

  #END OF SOLUTION, solution.ok? = yes


  ## MAIL CONFIG OK
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :address => "smtp.gmail.com",
      :port => 587,
      :domain => 'codescrum.com',
      :user_name => 'test@codescrum.com',
      :password => 'testpasswordforapi',
      :authentication => 'plain',
      :enable_starttls_auto => true}

  ## AUTOLOAD LIB FOLDER

  #ActiveSupport::Dependencies.explicitly_unloadable_constants << 'IRCGateway'
  #ActiveSupport::Dependencies.explicitly_unloadable_constants << 'DeviceCommandProcessor'

  #ActiveSupport::Dependencies.autoload_paths << "#{Rails.root}/lib/irc"
  #ActiveSupport::Dependencies.autoload_paths << "#{Rails.root}/lib/bayeux"

end
