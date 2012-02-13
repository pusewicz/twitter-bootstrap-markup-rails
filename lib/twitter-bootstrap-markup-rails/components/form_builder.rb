module Twitter::Bootstrap::Markup::Rails::Components
  class FormBuilder < ActionView::Helpers::FormBuilder
    def text_field(method, options={})
      input_html = super(method, options)
      Form::InputField.new(object_name, method, input_html, options).to_s
    end

    def password_field(method, options={})
      input_html = super(method, options)
      Form::InputField.new(object_name, method, input_html, options).to_s
    end
  end
end