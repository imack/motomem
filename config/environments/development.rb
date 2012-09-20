Motomem::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # ActionMailer Config
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :address => "smtp.gmail.com",
      :port => 587,
      :domain => '@dev.placeling.com',
      :user_name => 'placeling.dev',
      :password => 'gmail4placeling',
      :authentication => 'plain',
      :enable_starttls_auto => true}

  #DON'T REMOVE THIS LINE! -Prevents test emails from going to users
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.action_mailer.default_url_options = {:host => 'dev.motomem.com', :port => 3000, :protocol => 'http'}

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin


  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
