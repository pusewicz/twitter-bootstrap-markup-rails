require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::IconHelpers do
  include BootstrapSpecHelper

  describe "#bootstrap_icon_tag" do
    before do
      @output_buffer = ''
    end

    it "has icon class" do
      concat bootstrap_icon_tag("search")
      output_buffer.should have_tag("i.icon-search")
    end

    it "has color class" do
      concat bootstrap_icon_tag("search", :color => "white")
      output_buffer.should have_tag("i.icon-white")
    end

    it "should add html_options to the resulting tag when specified" do
      concat bootstrap_icon_tag("search", :html_options => {:"data-test" => "42"})
      output_buffer.should have_tag("i[data-test='42']")
    end
  end
end

