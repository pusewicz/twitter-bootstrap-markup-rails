module Twitter::Bootstrap::Markup::Rails::Components
  class Modal < Base
    attr_reader :collection

    def initialize(body_elements, footer_elements, options = {})
      super
      @body_elements = body_elements
      @footer_elements = footer_elements
    end

    def to_s
      output_buffer << content_tag(:div, :id => options[:dom_id], :class => modal_classes) do
        html=''
        html << build_header
        html << build_body
        html << build_footer
        html.html_safe
      end
      super
    end

    private
    def default_options
      {:dom_id => 'twitter-bootstrap-modal', :fade => false, :header_title => ''}
    end

    def modal_classes
      classes = %w(modal)
      classes.push 'fade' if options[:fade]
      classes.join " "
    end

    def build_header
      content_tag(:div, :class => "modal-header") do
        content_tag(:a, "&times".html_safe, :class => 'close', :"data-dismiss" => "modal" ) + content_tag(:h3, options[:header_title])
      end
    end

    def build_body
      html = ''
      @body_elements.each do |e|
        html << e.to_s
      end
      content_tag(:div, html.html_safe, :class => "modal-body")
    end

    def build_footer
      html = ''
      @footer_elements.each do |e|
        html << e.to_s
      end
      content_tag(:div, html.html_safe, :class => "modal-footer")
    end

  end
end

