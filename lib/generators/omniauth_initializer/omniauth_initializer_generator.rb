require 'rails/generators'
require 'rails/generators/named_base'

class OmniauthInitializerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)


  def copy_api_keys_file
    copy_file "api_keys.yml", "config/api_keys.yml"
  end

  def create_omniauth_initializer_file
    create_file "config/initializers/omniauth_initializer.rb", <<-FILE
API_KEYS = YAML::load_file("#{Rails.root}/config/api_keys.yml")[Rails.env]
Rails.application.config.middleware.use OmniAuth::Builder do
  # Uncomment the providers you wish to use and/or add other providers.
  #provider :twitter, API_KEYS['twitter']['api_key'], API_KEYS['twitter']['api_secret']
  #provider :facebook, API_KEYS['facebook']['api_key'], API_KEYS['facebook']['api_secret']
end
    FILE
  end

  def copy_sessions_controller_file
    copy_file "sessions_controller.rb", "app/controllers/#{file_name.pluralize}_controller.rb"
  end

  def add_callback_route
    line = "Application.routes.draw do"
    gsub_file 'config/routes.rb', /(#{Regexp.escape(line)})/mi do |match|
      "#{match}\n  \n# Omniauth Callback will hit the action below\nget '/auth/:provider/callback', :to => '#{file_name.pluralize}#create'\n"
    end
  end
end
