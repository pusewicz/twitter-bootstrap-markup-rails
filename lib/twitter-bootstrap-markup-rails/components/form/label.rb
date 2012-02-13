module Twitter::Bootstrap::Markup::Rails::Components
  class Form::Label < Form
    def initialize(object_name, method, options)
      super(options)
      output_buffer << label(object_name, method, options[:label_text], :class => 'control-label')
    end
  end
end