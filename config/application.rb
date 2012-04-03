# coding: utf-8
require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module AuricaCurkan
class Application < Rails::Application
  config.autoload_paths += [config.root.join('lib')]
  config.encoding = 'utf-8'

  config.time_zone = 'UTC'

end
end
