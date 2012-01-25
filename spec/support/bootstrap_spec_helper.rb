require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'
require 'action_dispatch'

module FakeHelpersModule
end

module BootstrapSpecHelper
  include ActionPack
  include ActionView::Context if defined?(ActionView::Context)
  include ActionController::RecordIdentifier
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::ActiveRecordHelper if defined?(ActionView::Helpers::ActiveRecordHelper)
  include ActionView::Helpers::ActiveModelHelper if defined?(ActionView::Helpers::ActiveModelHelper)
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::AssetTagHelper
  include ActiveSupport
  include ActionController::PolymorphicRoutes if defined?(ActionController::PolymorphicRoutes)

  def _routes
    url_helpers = mock('url_helpers')
    url_helpers.stub!(:hash_for_posts_path).and_return({})
    url_helpers.stub!(:hash_for_post_path).and_return({})
    url_helpers.stub!(:hash_for_post_models_path).and_return({})
    url_helpers.stub!(:hash_for_authors_path).and_return({})

    mock('_routes',
         :url_helpers => url_helpers,
         :url_for => "/mock/path"
        )
  end

  def controller
    env = mock('env', :[] => nil)
    request = mock('request', :env => env)
    mock('controller', :controller_path= => '', :params => {}, :request => request)
  end

  def default_url_options
    {}
  end

  def self.included(base)
    base.class_eval do

      attr_accessor :output_buffer

      def protect_against_forgery?
        false
      end

      def _helpers
        FakeHelpersModule
      end

    end
  end
end

