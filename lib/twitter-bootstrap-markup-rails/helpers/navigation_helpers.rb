# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module NavigationHelpers

    # Render a navigation list
    #
    # @param [Hash] options hash containing options (default: {}):
    #            :type    - could be either 'tabs' or 'pills'. Default is 'tabs'.
    #            :stacked - if true, renders the navigation list in stacked mode.
    #
    # Examples
    #
    #   bootstrap_navigation(:type => "tabs", :stacked => true) do |nav|
    #     nav.link_to "Nav1", "/link1", :active_nav => true
    #     nav.link_to "Nav2", "/link2"
    #   end
    #
    # Returns HTML String for the navigation list
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

