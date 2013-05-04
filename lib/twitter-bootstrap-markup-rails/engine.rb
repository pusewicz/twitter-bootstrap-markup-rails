require 'rails'

module Twitter::Bootstrap::Markup::Rails
  class Engine < ::Rails::Engine
    initializer 'twitter.bootstrap.markup.rails.initialize' do
      ActiveSupport.on_load(:action_view) do
        include Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers
        include Twitter::Bootstrap::Markup::Rails::Helpers::InlineLabelHelpers
        include Twitter::Bootstrap::Markup::Rails::Helpers::FormHelpers
        include Twitter::Bootstrap::Markup::Rails::Helpers::ButtonHelpers
        include Twitter::Bootstrap::Markup::Rails::Helpers::NavigationHelpers
        include Twitter::Bootstrap::Markup::Rails::Helpers::ModalHelpers
        include Twitter::Bootstrap::Markup::Rails::Helpers::IconHelpers
      end
    end
  end
end

