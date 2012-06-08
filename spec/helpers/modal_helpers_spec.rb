# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::ModalHelpers do
  include BootstrapSpecHelper
  include BootstrapModalMacros

  describe "#bootstrap_modal" do
    before do
      @output_buffer = ''
      build_bootstrap_modal(:dom_id => "an_id", :fade => true, :header_title => "a title") do |modal|
        modal.body do |body|
          body.content_tag :div, "the body"
        end
        modal.footer do |footer|
          footer.content_tag :div, "the footer"
        end
      end      
    end
    
    it "should create a modal popup with header, body and footer" do
      output_buffer.should have_tag('div.modal') do |div|
        div.should have_tag('div.modal-header')
        div.should have_tag('div.modal-body')
        div.should have_tag('div.modal-footer')
      end
    end
    
    it "should create a modal popup with the given DOM ID" do
      output_buffer.should have_tag('div.modal#an_id')
    end

    it "should create a modal popup with the CSS class set if fade was passed" do
      output_buffer.should have_tag('div.modal.fade#an_id')
    end

    it "should create a modal popup with the given header title" do
      output_buffer.should have_tag('div.modal#an_id') do |div|
        div.should have_tag("h3", :text => "a title")
      end
    end
    
    it "should create a modal popup with the given body content placed" do
      output_buffer.should have_tag('div.modal#an_id') do |div|
        div.should have_tag("div.modal-body") do |body|
          body.should have_tag("div", :text => "the body")
        end
      end
    end

    it "should create a modal popup with the given footer content placed" do
      output_buffer.should have_tag('div.modal#an_id') do |div|
        div.should have_tag("div.modal-footer") do |body|
          body.should have_tag("div", :text => "the footer")
        end
      end
    end
    
  end
end