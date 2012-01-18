# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module AlertHelpers
    def twitter_alert_info_block(message, opts = {})
      twitter_alert(message, opts.merge({ :type => "info", :block => true }))
    end

    def twitter_alert(message, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Alert.new(
        message,
        options
      ).to_s
    end
  end
end

