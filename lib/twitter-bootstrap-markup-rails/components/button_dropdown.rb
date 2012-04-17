module Twitter::Bootstrap::Markup::Rails::Components
  class ButtonDropdown < Base
    attr_reader :collection

    def initialize(elements, options = {})
      super
      @elements = elements
    end

    def to_s
      output_buffer << content_tag(:div, :class => 'btn-group') do
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
      {}
    end

    def build_dropdown
      if @elements.size > 0
        dropdown = @elements.shift
        dropdown.options[:dropdown] = true
        dropdown.to_s
      else
        ''
      end
    end
  end
end

