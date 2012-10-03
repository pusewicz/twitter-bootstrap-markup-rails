# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::ButtonHelpers do
  include BootstrapSpecHelper
  include BootstrapButtonMacros

  describe "#bootstrap_button" do
    before do
      @output_buffer = ''
    end

    it "should create a button with the btn class" do
      concat bootstrap_button("Text", "#")
      output_buffer.should have_tag('a.btn')
    end

    it "should have text" do
      concat bootstrap_button("Text", "#")
      output_buffer.should have_tag('a', /Text/)
    end

    it "should link to the specified url" do
      concat bootstrap_button("Text", "http://example.test")
      output_buffer.should have_tag("a[href='http://example.test']")
    end

    it "should have disabled class when :disabled is true" do
      concat bootstrap_button("Text", "#", :disabled => true)
      output_buffer.should have_tag("a.disabled")
    end

    it "should add an additional class when :type is a string" do
      concat bootstrap_button("Text", "#", :type => 'test')
      output_buffer.should have_tag("a.test")
    end

    it "should add additional classes when :type is an array" do
      concat bootstrap_button("Text", "#", :type => ['test1', 'test2'])
      output_buffer.should have_tag("a.test1")
      output_buffer.should have_tag("a.test2")
    end

    it "should add an icon when :icon is specified" do
      concat bootstrap_button("Text", "#", :icon => 'icon-search')
      output_buffer.should have_tag("a.btn i.icon-search")
    end

    it "should add a white icon when :icon_white is true" do
      concat bootstrap_button("Text", "#", :icon => 'icon-search', :icon_white => true)
      output_buffer.should have_tag("a.btn i.icon-search")
      output_buffer.should have_tag("a.btn i.icon-white")
    end

    it "should add an id when :id is specified" do
      concat bootstrap_button("Text", "#", :id => "foo")
      output_buffer.should have_tag("a#foo")
    end

    it "should add html_options to the resulting a tag when specified" do
      concat bootstrap_button("Text", "#", :html_options => {:target => "_top"})
      output_buffer.should have_tag("a[target='_top']")
    end

    it "should accept a block instead of text" do
      concat bootstrap_button("#"){"<span class='content'>Text</span>"}
      output_buffer.should have_tag("a span.content")
    end

    it "should set href to '#' if link is not given" do
      concat bootstrap_button
      output_buffer.should have_tag("a[href='#']")
    end
  end


  describe "#bootstrap_button_dropdown" do
    before do
      @output_buffer = ''
    end

    it "should create a dropdown button when called with a button and one (or more) links" do
      build_bootstrap_button_dropdown do |d|
        d.bootstrap_button "Button Text", "#"
        d.link_to "Link Text", "#"
      end

      output_buffer.should have_tag('div.btn-group') do |div|
        div.should have_tag('a.btn')
        div.should have_tag('ul.dropdown-menu a')
      end
    end

    it "should properly merge html_options into the container div" do
      build_bootstrap_button_dropdown(:html_options => {:id => "foo"}) do |d|
        d.bootstrap_button "Button Text", "#"
        d.link_to "This", "#"
      end

      output_buffer.should have_tag('div.btn-group#foo')
    end

    it "should properly add classes from html_options onto the container div" do
      build_bootstrap_button_dropdown(:html_options => {:class => "foo"}) do |d|
        d.bootstrap_button "Button Text", "#"
        d.link_to "This", "#"
      end

      output_buffer.should have_tag('div.btn-group.foo')
    end

    it "should build a split dropdown if split=true" do
      build_bootstrap_button_dropdown(:split => true) do |d|
        d.bootstrap_button "Button Text", "#", :class => "foo"
        d.link_to "This", "#"
      end

      output_buffer.should have_tag('div.btn-group') do |div|
        div.should have_tag('a.foo')
        div.should have_tag('a.dropdown-toggle')
        # Ensure that a.foo and a.dropdown-toggle are two different links
        div.should_not have_tag('a.foo.dropdown-toggle')
        div.should have_tag('ul.dropdown-menu a')
      end
    end

    it "should pass button_options to its buttons" do
      build_bootstrap_button_dropdown(:split => true, :button_options => {:type => "btn-success"}) do |d|
        d.bootstrap_button "Button Text", "#", :class => "foo"
        d.link_to "This", "#"
      end

      output_buffer.should have_tag('div.btn-group') do |div|
        div.should have_tag('a.foo.btn-success')
        div.should have_tag('a.dropdown-toggle.btn-success')
      end
    end

    it "should properly merge menu_html_options" do
      build_bootstrap_button_dropdown(:menu_html_options => {:class => "pull-right"}) do |d|
        d.bootstrap_button "Button Text", "#", :class => "foo"
        d.link_to "This", "#"
      end

      output_buffer.should have_tag('div.btn-group') do |div|
        div.should have_tag('ul.dropdown-menu.pull-right')
      end
    end
  end
end