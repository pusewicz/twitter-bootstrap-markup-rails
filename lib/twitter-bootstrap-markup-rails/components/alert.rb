module Twitter::Bootstrap::Markup::Rails::Components
  class Alert < Base
    attr_reader :message

    def initialize(message, options = {})
      super
      @message = message
    end

    def to_s
      output_buffer << content_tag(:div, build_div_options) do
        html = ""
        html << build_close_tag.html_safe   if options[:close]
        html << build_heading_tag.html_safe if options[:heading]
        html << message
        html.html_safe
      end.html_safe
      super
    end

    private
    def default_options
      {
        :class        => "alert",
        :block        => false,
        :close        => true,
        :heading      => nil,
        :dismiss      => true,
        :type         => nil,
        :html_options => {}
      }
    end

    def build_close_tag
      content_tag(:a, "&times;".html_safe, close_tag_options)
    end

    def build_heading_tag
      options[:block] ? build_block_heading : build_inline_heading
    end

    def build_block_heading
      content_tag(:h4, options[:heading], :class => 'alert-heading')
    end

    def build_inline_heading
      content_tag(:strong, options[:heading])
    end

    def close_tag_options
      opts = { :class => "close" }
      opts["data-dismiss"] = "alert" if options[:dismiss]
      opts
    end

    def build_div_options
      opts = { :class => build_class }
      opts.reverse_merge(options[:html_options])
    end

    def build_class
      classes = %w(alert)
      classes << "alert-block"   if options[:block]
      classes << "alert-#{options[:type]}" if options[:type]
      classes.join(" ")
    end
  end
end

