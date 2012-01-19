module Twitter::Bootstrap::Markup::Rails::Components
  class InlineLabel < Base
    attr_reader :message

    def initialize(message, options = {})
      super
      @message = message
    end

    def to_s
      output_buffer << content_tag(:span, message, :class => build_class).html_safe
      super
    end

    private
    def default_options
      {
        :class   => "label",
        :type    => nil
      }
    end

    def build_class
      classes = [options[:class]]
      classes << options[:type] if options[:type]
      classes.join(" ")
    end
  end
end

