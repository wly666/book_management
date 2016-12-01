require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'
include Log4r

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookManagement
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    log4r_config= YAML.load_file(File.join(File.dirname(__FILE__),"log4r.yml"))
    YamlConfigurator.decode_yaml( log4r_config['log4r_config'] )
    config.logger = Log4r::Logger[Rails.env]
  end
end
