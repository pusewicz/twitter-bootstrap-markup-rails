# encoding: utf-8

require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers do
  include BootstrapSpecHelper

  %w(error success info).each do |type|
    describe "#twitter_alert_#{type}_block" do
      before do
        @output_buffer = ''
      end

      it "has alert class" do
        concat send("twitter_alert_#{type}_block", "Message")
        output_buffer.should have_tag("div.alert")
      end

      it "has alert-block class" do
        concat send("twitter_alert_#{type}_block", "Message")
        output_buffer.should have_tag("div.alert-block")
      end

      it "has alert-#{type} class" do
        concat send("twitter_alert_#{type}_block", "Message")
        output_buffer.should have_tag("div.alert-#{type}")
      end

      it "has a message" do
        concat send("twitter_alert_#{type}_block", "Message")
        output_buffer.should have_tag('div', /Message/)
      end

      it "has close button" do
        concat send("twitter_alert_#{type}_block", "Message")
        output_buffer.should have_tag('div a.close', /×/)
      end

      it "has dismiss tag" do
        concat send("twitter_alert_#{type}_block", "Message")
        output_buffer.should have_tag('div a[data-dismiss="alert"]')
      end

      it "has a heading" do
        concat send("twitter_alert_#{type}_block", "Message", :heading => "Heading1")
        output_buffer.should have_tag('div h4.alert-heading', /Heading1/)
      end
    end

    describe "#twitter_alert_#{type}" do
      before do
        @output_buffer = ''
      end

      it "has alert class" do
        concat send("twitter_alert_#{type}", "Message")
        output_buffer.should have_tag("div.alert")
      end

      it "has alert-#{type} class" do
        concat send("twitter_alert_#{type}", "Message")
        output_buffer.should have_tag("div.alert-#{type}")
      end

      it "has a message" do
        concat send("twitter_alert_#{type}", "Message")
        output_buffer.should have_tag('div', /Message/)
      end

      it "has close button" do
        concat send("twitter_alert_#{type}", "Message")
        output_buffer.should have_tag('div a.close', /×/)
      end

      it "has dismiss tag" do
        concat send("twitter_alert_#{type}", "Message")
        output_buffer.should have_tag('div a[data-dismiss="alert"]')
      end

      it "has a heading" do
        concat send("twitter_alert_#{type}", "Message", :heading => "Heading1")
        output_buffer.should have_tag('div strong', /Heading1/)
      end
    end
  end
end

