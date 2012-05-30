module Twitter::Bootstrap::Markup::Rails::Components
  class ProgressBar < base
    attr_accessor :width

    def initialize(width, options = {})
      super
      @width = width
    end

    def to_s
      output_buffer << content_tag(:div, build_div_options) do
        html_text = ""
        html_text << build_bar_tag
      end.html_safe
      super
    end

    private

    def default_options
      {
        :class => 'progress',
        :type = [],
        :html_options = {}
      }
    end

    def build_bar_tag
      ops = { :class => 'bar', :style => 'width: #{width}%;' }
      content_tag(:div, ops)
    end

    def build_div_options
      ops = { :class => build_class }
      ops.reverse_merge(options[:html_options])
    end

    def build_class
      classes = [options[:class]]

      if options[:type].is_a?(Array)
        classes = classes | options[:type].map{|c| c.to_s}
      else
        classes << options[:type]
      end

      classes.join(" ")
  end
end
