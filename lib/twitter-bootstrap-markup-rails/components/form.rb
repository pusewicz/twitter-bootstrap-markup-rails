module Twitter::Bootstrap::Markup::Rails::Components
  class Form < Base
    autoload :InputField, 'twitter-bootstrap-markup-rails/components/form/input_field'
    autoload :Label, 'twitter-bootstrap-markup-rails/components/form/label'

    include ActionView::Helpers::FormHelper

    protected

    def default_options
      {}
    end
  end
end