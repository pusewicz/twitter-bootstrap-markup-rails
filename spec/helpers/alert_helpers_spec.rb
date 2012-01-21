# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers do
  include BootstrapSpecHelper

  %w(error success info).each do |type|
    describe "#bootstrap_alert_#{type}_block_tag" do
      before do
        @output_buffer = ''
      end

      it "has alert class" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        output_buffer.should have_tag("div.alert")
      end

      it "has alert-block class" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        output_buffer.should have_tag("div.alert-block")
      end

      it "has alert-#{type} class" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        output_buffer.should have_tag("div.alert-#{type}")
      end

      it "has a message" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        output_buffer.should have_tag('div', /Message/)
      end

      it "has close button" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        output_buffer.should have_tag('div a.close', /×/)
      end

      it "has dismiss tag" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message")
        output_buffer.should have_tag('div a[data-dismiss="alert"]')
      end

      it "has a heading" do
        concat send("bootstrap_alert_#{type}_block_tag", "Message", :heading => "Heading1")
        output_buffer.should have_tag('div h4.alert-heading', /Heading1/)
      end
    end

    describe "#bootstrap_alert_#{type}_tag" do
      before do
        @output_buffer = ''
      end

      it "has alert class" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        output_buffer.should have_tag("div.alert")
      end

      it "has alert-#{type} class" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        output_buffer.should have_tag("div.alert-#{type}")
      end

      it "has a message" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        output_buffer.should have_tag('div', /Message/)
      end

      it "has close button" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        output_buffer.should have_tag('div a.close', /×/)
      end

      it "has dismiss tag" do
        concat send("bootstrap_alert_#{type}_tag", "Message")
        output_buffer.should have_tag('div a[data-dismiss="alert"]')
      end

      it "has a heading" do
        concat send("bootstrap_alert_#{type}_tag", "Message", :heading => "Heading1")
        output_buffer.should have_tag('div strong', /Heading1/)
      end
    end
  end
end

