module Twitter
  module Bootstrap
    module Markup
      module Rails
        require_relative "twitter-bootstrap-markup-rails/version"

        autoload :Helpers, "twitter-bootstrap-markup-rails/helpers"
        autoload :Components, "twitter-bootstrap-markup-rails/components"

        require_relative "twitter-bootstrap-markup-rails/engine" if defined?(::Rails)
      end
    end
  end
end

