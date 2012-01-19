# encoding: utf-8

require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::InlineLabelHelpers do
  include BootstrapSpecHelper

  describe "#inline_label" do
    before do
      @output_buffer = ''
    end

    it "has label class" do
      concat twitter_inline_label("Hi There")
      output_buffer.should have_tag("span.label")
    end

    it "has a message" do
      concat twitter_inline_label("Hi There")
      output_buffer.should have_tag("span", "Hi There")
    end
  end

  %w(success warning important notice).each do |type|
    describe "#inline_label_#{type}" do
      before do
        @output_buffer = ''
      end

      it "has label class" do
        concat send("twitter_inline_label_#{type}", "Message")
        output_buffer.should have_tag("span.label")
      end

      it "has #{type} class" do
        concat send("twitter_inline_label_#{type}", "Message")
        output_buffer.should have_tag("span.#{type}")
      end

      it "has a message" do
        concat send("twitter_inline_label_#{type}", "Message")
        output_buffer.should have_tag('span', /Message/)
      end
    end
  end
end

