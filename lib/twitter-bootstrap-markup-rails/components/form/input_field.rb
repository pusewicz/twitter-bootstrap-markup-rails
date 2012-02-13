module Twitter::Bootstrap::Markup::Rails::Components
  class Form::InputField < Form
    attr_accessor :input_html, :label_html

    def initialize(object_name, method, input_html, options = {})
      super(options)
      @input_html = input_html
      @label_html = Label.new(object_name, method, options) if options[:label] || options[:label_text]
    end

    def to_s
      output_buffer << content_tag(:div, :class => 'control-group') do
        html = ''
        html << label_html.to_s
        html << content_tag(:div, :class => 'controls') do
          build_input_wrapper
        end
        html.html_safe
      end
      super
    end

    private

    def build_input_wrapper
      if options[:add_on]
        build_add_on_wrapper
      else
        input_html
      end
    end

    def build_add_on_wrapper
      content_tag(:div, :class => "input-#{options[:add_on][:position] || 'prepend'}") do
        add_on = ''
        add_on << input_html
        add_on << content_tag(:span, :class => 'add-on') do
          add_on_content = ''
          add_on_content << content_tag(:i, '', :class => options[:add_on][:icon]) if options[:add_on][:icon]
          add_on_content << options[:add_on][:text] if options[:add_on][:text]
          add_on_content.html_safe
        end
        add_on.html_safe
      end
    end
  end
end