require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::InlineLabelHelpers do
  include BootstrapSpecHelper

  describe "#inline_label_tag" do
    before do
      @output_buffer = ''
    end

    it "has label class" do
      concat bootstrap_inline_label_tag("Hi There")
      output_buffer.should have_tag("span.label")
    end

    it "has a message" do
      concat bootstrap_inline_label_tag("Hi There")
      output_buffer.should have_tag("span", "Hi There")
    end
  end

  %w(success warning important notice).each do |type|
    describe "#inline_label_#{type}_tag" do
      before do
        @output_buffer = ''
      end

      it "has label class" do
        concat send("bootstrap_inline_label_#{type}_tag", "Message")
        output_buffer.should have_tag("span.label")
      end

      it "has #{type} class" do
        concat send("bootstrap_inline_label_#{type}_tag", "Message")
        output_buffer.should have_tag("span.#{type}")
      end

      it "has a message" do
        concat send("bootstrap_inline_label_#{type}_tag", "Message")
        output_buffer.should have_tag('span', /Message/)
      end
    end
  end
end

