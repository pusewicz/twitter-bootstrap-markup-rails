# encoding: utf-8
require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::FormHelpers do
  include BootstrapSpecHelper
  include BootstrapFormMacros

  describe "#bootstrap_form_for" do
    it "should create a form tag" do
      block = Proc.new {}
      concat bootstrap_form_for 'an_object', :url => 'a_url', &block
      output_buffer.should have_tag('form')
    end

    context "text_field" do
      it "should wrap a text input within the magical div tags" do
        build_bootstrap_form do |f|
          f.text_field 'method'
        end

        output_buffer.should have_tag('div.control-group div.controls input[type=text]')
      end

      it "should add a label tag if :label is true" do
        build_bootstrap_form do |f|
          f.text_field 'method', :label => true
        end

        output_buffer.should have_tag('div.control-group') do |div|
          div.should have_tag('label.control-label')
          div.should have_tag('div.controls') do |div|
            div.should have_tag('input')
          end
        end
      end

      it "should add a label tag with custom text if :label_text is specified" do
        build_bootstrap_form do |f|
          f.text_field 'method', :label_text => 'a custom label'
        end

        output_buffer.should have_tag('div.control-group') do |div|
          div.should have_tag('label.control-label', :text => 'a custom label')
          div.should have_tag('div.controls') do |div|
            div.should have_tag('input')
          end
        end
      end

      context "add_on" do
        it "should wrap the input in div.input-prepend if :add_on hash is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {}
          end

          output_buffer.should have_tag('div.control-group') do |div|
            div.should have_tag('div.controls') do |div|
              div.should have_tag('div.input-prepend') do |div|
                div.should have_tag('input')
              end
            end
          end
        end

        it "should wrap the input in div.input-append if :position is :append" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {:position => :append}
          end

          output_buffer.should have_tag('div.control-group') do |div|
            div.should have_tag('div.controls') do |div|
              div.should have_tag('div.input-append') do |div|
                div.should have_tag('input')
              end
            end
          end
        end

        it "should add a span with text if :text is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {:text => 'a text'}
          end

          output_buffer.should have_tag('div.control-group') do |div|
            div.should have_tag('div.controls') do |div|
              div.should have_tag('div.input-prepend') do |div|
                div.should have_tag('input')
                div.should have_tag('span', :class => 'add-on', :text => 'a text')
              end
            end
          end
        end

        it "should add a span with icon if :icon is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :add_on => {:icon => 'icon-envelope'}
          end

          output_buffer.should have_tag('div.control-group') do |div|
            div.should have_tag('div.controls') do |div|
              div.should have_tag('div.input-prepend') do |div|
                div.should have_tag('input')
                div.should have_tag('span', :class => 'add-on') do |span|
                  span.should have_tag('i', :class => 'icon-envelope')
                end
              end
            end
          end
        end

        it "should add a help-block with custom text if :html_text is specified" do
          build_bootstrap_form do |f|
            f.text_field 'method', :help_text => 'You need help!'
          end

          output_buffer.should have_tag('div.control-group') do |div|
            div.should have_tag('div.controls') do |div|
              div.should have_tag('p', :class => 'help-block', :text => 'You need help!')
            end
          end
        end

      end
    end

    context "password_field" do
      it "should wrap a text input within the magical div tags" do
        build_bootstrap_form do |f|
          f.password_field 'method'
        end

        output_buffer.should have_tag('div.control-group div.controls input[type=password]')
      end
    end
  end
end
