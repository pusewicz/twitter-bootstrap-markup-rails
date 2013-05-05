module Twitter::Bootstrap::Markup::Rails::Components
  class Icon < Base
    attr_reader :name

    def initialize(name, options = {})
      @name = name
      super
    end

    def to_s
      output_buffer << content_tag(:i, nil, build_tag_options).html_safe
      super
    end

    private
    def default_options
      {
        :class        => "icon-#{name}",
        :color        => nil,
        :html_options => {}
      }
    end

    def build_class
      classes = [options[:class]]
      classes << "icon-#{options[:color]}" if options[:color]
      classes.join(" ")
    end

    def build_tag_options
      ops = {:class => build_class}
      ops.reverse_merge(options[:html_options])
    end
  end
end

