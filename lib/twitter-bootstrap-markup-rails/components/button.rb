module Twitter::Bootstrap::Markup::Rails::Components
  class Button < Base
    attr_reader :text

    def initialize(text, link, options = {})
      super
      @text = text
      @link = link
    end

    def to_s
      html_text = ""
      html_text << build_icon.html_safe << ' ' if options[:icon]
      html_text << text
      html_text << ' ' << build_caret.html_safe if options[:dropdown]

      output_buffer << content_tag(:a, html_text.html_safe, build_tag_options).html_safe
      super
    end

    private
    def default_options
      {
        :class        => "btn",
        :type         => [],
        :disabled     => false,
        :icon_white   => false,
        :dropdown     => false,
        :id           => nil,
        :html_options => {}
      }
    end

    def build_class
      classes = [options[:class]]

      if options[:type].is_a?(Array)
        classes = classes | options[:type].map{|c| c.to_s}
      else
        classes << options[:type]
      end

      classes << 'dropdown-toggle' if options[:dropdown]
      classes << 'disabled' if options[:disabled]

      classes.join(" ")
    end

    def build_icon
      klass = options[:icon]
      klass << ' icon-white' if options[:icon_white]
      content_tag(:i, nil, :class => klass)
    end

    def build_caret
      content_tag(:span, nil, :class => 'caret')
    end

    def build_tag_options
      ops = {:href => @link, :class => build_class}
      ops[:"data-toggle"] = 'dropdown' if options[:dropdown]
      ops[:id] = options[:id] if options[:id]
      ops.reverse_merge(options[:html_options])
    end
  end
end