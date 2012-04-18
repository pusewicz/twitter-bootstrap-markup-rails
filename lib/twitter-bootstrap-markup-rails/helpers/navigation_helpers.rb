# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module NavigationHelpers

    def bootstrap_navigation(options = {})
      elements = Twitter::Bootstrap::Markup::Rails::HelperCollection.new(self)

      yield elements

      Twitter::Bootstrap::Markup::Rails::Components::Navigation.new(
        elements,
        options
      ).to_s
    end

  end
end

