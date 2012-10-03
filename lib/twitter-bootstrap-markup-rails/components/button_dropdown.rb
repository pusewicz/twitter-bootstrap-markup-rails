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

        html << content_tag(:ul, build_menu_html_options) do
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
        :html_options => {},
        :split => false,
        :button_options => {},
        :menu_html_options => {}
      }
    end

    def build_class
      classes = %w(btn-group)
      classes << options[:html_options][:class] if options[:html_options][:class]
      classes.join(" ")
    end

    def build_menu_html_options
      classes = %w(dropdown-menu)
      classes << options[:menu_html_options][:class] if options[:menu_html_options][:class]

      options[:menu_html_options].merge(:class => classes.join(" "))
    end

    def build_dropdown
      html = ''

      if @elements.size > 0
        dropdown = @elements.shift
        dropdown.options.merge!(options[:button_options])
        dropdown.options[:dropdown] = !options[:split]

        html << dropdown.to_s

        if options[:split]
          caret = Button.new({:dropdown => true}.merge(options[:button_options]))
          html << caret.to_s
        end
      end

      html
    end
  end
end

