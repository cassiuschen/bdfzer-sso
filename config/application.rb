require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BDFZerSso
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :zh_CN

    #config.assets.paths << Rails.root.join("templates")

    Rack::MiniProfiler.config.position = 'right'

    config.to_prepare do
      # Base layout. Uses app/views/layouts/semantic-login.html.erb
      Doorkeeper::ApplicationController.layout "dashboard"

      # Only Applications list
      Doorkeeper::ApplicationsController.layout "dashboard"

      # Only Authorization endpoint
      Doorkeeper::AuthorizationsController.layout "application"

      # Only Authorized Applications
      Doorkeeper::AuthorizedApplicationsController.layout "dashboard"
    end

      # Assets
    config.assets.enabled = true
    config.assets.version = '1.1.1'
    # Compress JavaScripts and CSS.
    config.assets.js_compressor = :uglifier
    config.assets.css_compressor = :sass
    config.assets.precompile += %w(dashboard.js dashboard.css mobile.css mobile.js)
  end
end

CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "http://bdfz-cas.pkuschool.edu.cn:80/cas/",
  :validate_url => "http://bdfz-cas.pkuschool.edu.cn:80/cas/serviceValidate"
)
