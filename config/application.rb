require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CongressFunding
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.cache_store                                    = :redis_store, "redis://localhost:6379"

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end
  end
end
