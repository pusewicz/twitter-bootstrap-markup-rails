# encoding: utf-8
module Twitter::Bootstrap::Markup::Rails::Helpers
  module InlineLabelHelpers
    # Renders inline label
    #
    # @param [String] message message to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :type    - The String type of alert to display: success warning important notice
    #
    # Examples
    #
    #   twitter_inline_label("Hello!")
    #   # => '<span class="label">Hello!</span>'
    #
    # Returns HTML String for the label
    def twitter_inline_label(message, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::InlineLabel.new(
        message,
        options
      ).to_s
    end

    %w(success warning important notice).each do |type|
      module_eval <<-EOF
        def twitter_inline_label_#{type}(message, options = {})
          twitter_inline_label(message, options.merge({ :type => "#{type}" }))
        end
      EOF
    end
  end
end

