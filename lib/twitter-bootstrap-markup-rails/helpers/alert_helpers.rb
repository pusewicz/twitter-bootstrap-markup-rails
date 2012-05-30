# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module AlertHelpers
    # Renders alert message
    #
    # @param [String] message message to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :block        - The Boolean whether to display as a block (optional)
    #           :close        - The Boolean whether to render close button
    #           :heading      - The String heading message to render
    #           :dismiss      - The Boolean whether to add dismiss attribute
    #           :type         - The String type of alert to display: error, success or info
    #           :html_options - Any additional HTML options desired on the alert DIV.
    #
    # Examples
    #
    #   bootstrap_alert_tag("Hello!")
    #   # => '<div class="alert"><a class="close">×</a>Hello!</div>'
    #
    # Returns HTML String for the alert
    def bootstrap_alert_tag(message, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Alert.new(
        message,
        options
      ).to_s
    end

    %w(error success info).each do |type|
      module_eval <<-EOF
        def bootstrap_alert_#{type}_tag(message, options = {})
          bootstrap_alert_tag(message, options.merge({ :type => "#{type}" }))
        end

        def bootstrap_alert_#{type}_block_tag(message, options = {})
          bootstrap_alert_tag(message, options.merge({ :type => "#{type}", :block => true }))
        end
      EOF
    end
  end
end

