module Twitter::Bootstrap::Markup::Rails::Components
  class ProgressBar < Base
    attr_accessor :width

    def initialize(width, options = {})
      super
      @width = width
    end

    def to_s
      output_buffer << content_tag(:div, build_div_options) do
        build_bar_tag.html_safe
      end.html_safe
      super
    end

    private

    def default_options
      {
        :class        => 'progress',
        :type         => [],
        :html_options => {}
      }
    end

    def build_bar_tag
      ops = { :class => 'bar', :style => "width: #{width}%;" }
      content_tag(:div, nil, ops)
    end

    def build_div_options
      ops = { :class => build_class }
      ops.reverse_merge(options[:html_options])
    end

    def build_class
      classes = [options[:class]]

      if options[:type].is_a?(Array)
        classes = classes | options[:type].map { |c| "progress-#{c.to_s}" }
      else
        classes << "progress-#{options[:type]}"
      end

      classes << "active" if options[:active]

      classes.join(" ")
    end
  end
end
