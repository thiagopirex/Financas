Bundler.require(:default, Rails.env) if defined?(Bundler)

module Financas
  class Application < Rails::Application
    config.encoding = "UTF-8"
    config.filter_parameters += [:password]
  end
end