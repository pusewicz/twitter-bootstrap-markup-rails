$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

module Twitter
  module Bootstrap
    module Markup
      module Rails
        require "twitter-bootstrap-markup-rails/version"

        autoload :Helpers, "twitter-bootstrap-markup-rails/helpers"
        autoload :Components, "twitter-bootstrap-markup-rails/components"

        require "twitter-bootstrap-markup-rails/engine" if defined?(::Rails)
        require "twitter-bootstrap-markup-rails/plugins"
      end
    end
  end
end

