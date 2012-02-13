module Twitter::Bootstrap::Markup::Rails::Helpers
  module FormHelpers
    # Form builder
    # TODO add documentation
    def bootstrap_form_for(*args, &block)
      options = args.extract_options!
      options.reverse_merge!(:builder => Twitter::Bootstrap::Markup::Rails::Components::FormBuilder)
      form_for(*(args + [options]), &block)
    end
  end
end
