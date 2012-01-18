# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module AlertHelpers
    %w(error success info).each do |type|
      module_eval <<-EOF
        def twitter_alert_#{type}(message, options = {})
          twitter_alert(message, options.merge({ :type => "#{type}" }))
        end

        def twitter_alert_#{type}_block(message, options = {})
          twitter_alert(message, options.merge({ :type => "#{type}", :block => true }))
        end
      EOF
    end

    # Renders alert message
    #
    # @param [String] message message to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :block   - The Boolean whether to display as a block (optional)
    #           :close   - The Boolean whether to render close button
    #           :heading - The String heading message to render
    #           :dismiss - The Boolean whether to add dismiss attribute
    #           :type    - The String type of alert to display: error, success or info
    #
    # Examples
    #
    #   twitter_alert("Hello!")
    #   # => '<div class="alert"><a class="close">×</a>Hello!</div>'
    #
    # Returns HTML String for the alert
    def twitter_alert(message, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Alert.new(
        message,
        options
      ).to_s
    end
  end
end

