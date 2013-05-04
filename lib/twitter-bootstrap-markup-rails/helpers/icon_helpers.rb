# encoding: utf-8
module Twitter::Bootstrap::Markup::Rails::Helpers
  module IconHelpers
    # Renders an icon.
    #
    # Includes support for alternate color sets. Bootstrap only supports black (the default) and white ("inverted")
    # icons out of the box. Other color sets can be found elsewhere (e.g.
    # https://github.com/twitter/bootstrap/pull/2520).
    #
    # Examples:
    #
    #   bootstrap_icon("globe")
    #   # => '<i class="icon-globe"></i>'
    #
    #   bootstrap_icon("briefcase", :color => "white")
    #   # => '<i class="icon-globe icon-white"></i>'
    #
    # @param [String] name the name of the icon to display (e.g. "search", "thumbs-up")
    # @option options [String] :color ("black") the color set from which the icon is chosen
    # @option options [Hash] :html_options ({}) passed through to +content_tag+ to set attributes on the icon tag
    #
    # @return [String] the HTML string
    # @see http://twitter.github.io/bootstrap/base-css.html#icons
    def bootstrap_icon_tag(name, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Icon.new(
        name,
        options
      ).to_s
    end
  end
end
