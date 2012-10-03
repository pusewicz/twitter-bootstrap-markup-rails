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
          html_class = build_html_class(e)
          html << content_tag(:li, e.to_s, html_class)
        end

        html.html_safe
      end
      super
    end

    private

    def default_options
      {}
    end

    def build_html_class(element)
      html_class = {}
      if element.options[:active_nav]
        element.options.reject! {|k,v| k == :active_nav }
        html_class = { :class => "active" }
      end
      html_class
    end

    def build_class
      classes = %w( nav )
      classes << "nav-#{ options[:type] || "tabs" }"
      classes << "nav-stacked" if options[:stacked]
      classes << options[:custom_classes]
      classes.join(" ")
    end
  end
end

