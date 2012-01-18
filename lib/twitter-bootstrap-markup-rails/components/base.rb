# -*- encoding: utf-8 -*-
module Twitter::Bootstrap::Markup::Rails::Components
  class Base
    include ActionView::Helpers::TagHelper

    attr_accessor :output_buffer, :options, :default_options

    def initialize(*args)
      @output_buffer = ""
      @options = args.extract_options!.reverse_merge(default_options)
    end

    def to_s
      @output_buffer.to_s.html_safe
    end
  end
end

