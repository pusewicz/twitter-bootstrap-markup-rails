# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::NavigationHelpers do
  include BootstrapSpecHelper
  include BootstrapNavigationMacros

  describe "#bootstrap_navigation" do
    before do
      @output_buffer = ''
    end

    it "should create a navigation list when called with a list of links" do
      build_bootstrap_navigation(:type => "tabs", :stacked => true) do |nav|
        nav.link_to "Nav1", "/link1"
        nav.link_to "Nav2", "/link2"
      end

      output_buffer.should have_tag('ul.nav.nav-tabs.nav-stacked') do |ul|
        ul.should have_tag('li a[@href="/link1"]')
        ul.should have_tag('li a[@href="/link1"]')
      end
    end
  end
end
