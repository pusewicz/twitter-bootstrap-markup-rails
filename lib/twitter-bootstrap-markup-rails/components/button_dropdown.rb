module Twitter::Bootstrap::Markup::Rails::Components
  class ButtonDropdown < Base
    attr_reader :collection

    def initialize(elements, options = {})
      super
      @elements = elements
    end

    def to_s
      div_options = {:class => build_class}
      output_buffer << content_tag(:div, div_options.reverse_merge(options[:html_options])) do
        html=''
        html << build_dropdown

        html << content_tag(:ul, :class => 'dropdown-menu') do
          menu = ''
          @elements.each do |e|
            menu << content_tag(:li, e.to_s)
          end
          menu.html_safe
        end

        html.html_safe
      end
      super
    end

    private
    def default_options
      {
        :html_options => {}
      }
    end

    def build_class
      classes = %w(btn-group)
      classes << options[:html_options][:class] if options[:html_options][:class]
      classes.join(" ")
    end

    def build_dropdown
      html = ''

      if @elements.size > 0
        dropdown = @elements.shift
        dropdown.options[:dropdown] = true
        html << dropdown.to_s
      end

      html
    end
  end
end

