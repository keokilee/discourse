require 'proper_discourse/plugin'
require 'bomberman'

module ProperDiscourse
  class Engine < Rails::Engine

    engine_name 'proper_discourse'

    initializer "proper_discourse.configure_rails_initialization" do |app|
      Bomberman.configure do |config|
        config.api_key = ENV['BOMBERMAN_API_KEY']
      end

      app.config.after_initialize do 
        DiscoursePluginRegistry.setup(ProperDiscourse::Plugin)
      end
    end

  end
end