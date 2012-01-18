# encoding: utf-8

require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers do
  include BootstrapSpecHelper

  before do
    @output_buffer = ''
  end

  describe "#twitter_alert_info_block" do
    it "has correct classes" do
      concat twitter_alert_info_block("Message")
      output_buffer.should have_tag('div.alert.alert-block.alert-info')
    end

    it "has correct message" do
      concat twitter_alert_info_block("Message")
      output_buffer.should have_tag('div', /Message/)
    end

    it "has close button" do
      concat twitter_alert_info_block("Message")
      output_buffer.should have_tag('div a.close', /×/)
    end

    it "has dismiss tag" do
      concat twitter_alert_info_block("Message")
      output_buffer.should have_tag('div a[data-dismiss="alert"]')
    end

    it "has a heading" do
      concat twitter_alert_info_block("Message", :heading => "Heading1")
      output_buffer.should have_tag('div h4.alert-heading', /Heading1/)
    end
  end
end

