require 'spec_helper'

describe ActionView::Base do
  before do
    @view = ActionView::Base
  end

  it "includes alert helpers" do
    @view.ancestors.should include(Twitter::Bootstrap::Markup::Rails::Helpers::AlertHelpers)
  end

  it "includes inline label helpers" do
    @view.ancestors.should include(Twitter::Bootstrap::Markup::Rails::Helpers::InlineLabelHelpers)
  end

  it "includes inline form helpers" do
    @view.ancestors.should include(Twitter::Bootstrap::Markup::Rails::Helpers::FormHelpers)
  end
end
