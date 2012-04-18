module Twitter::Bootstrap::Markup::Rails::Components
  class Navigation < Base
    attr_reader :collection

    def initialize(elements, options = {})
      super
      @elements = elements
    end

    def to_s
      output_buffer << content_tag(:ul, :class => build_class) do
        html = ""

        @elements.each do |e|
          html << content_tag(:li, e.to_s)
        end

        html.html_safe
      end
      super
    end

    private
    def default_options
      {}
    end

    def build_class
      classes = %w( nav )
      classes << "nav-#{options[:type]}" if options[:type]
      classes << "nav-stacked" if options[:stacked]
      classes.join(" ")
    end
  end
end

