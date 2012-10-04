module Twitter::Bootstrap::Markup::Rails::Components
  class InlineLabel < Base
    attr_reader :message

    def initialize(message, options = {})
      super
      @message = message
    end

    def to_s
      output_buffer << content_tag(:span, message, build_tag_options).html_safe
      super
    end

    private
    def default_options
      {
        :class        => "label",
        :type         => nil,
        :html_options => {}
      }
    end

    def build_class
      classes = [options[:class]]
      classes << "label-#{options[:type]}" if options[:type]
      classes.join(" ")
    end

    def build_tag_options
      ops = {:class => build_class}
      ops.reverse_merge(options[:html_options])
    end
  end
end

