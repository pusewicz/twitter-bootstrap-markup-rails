require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::ProgressBarHelpers do
  include BootstrapSpecHelper

  before do
    @output_buffer = ''
  end

  it 'should create a bar with the progress class' do
    concat bootstrap_progress_bar_tag(40)
    output_buffer.should have_tag("div.progress div.bar")
  end

  it 'should have the correct width' do
    concat bootstrap_progress_bar_tag(40)
    output_buffer.should have_tag(:div, :style => 'width: 40%;')
  end

  it 'stores sets the type of the progress bar' do
    concat bootstrap_progress_bar_tag(40, :type => :striped)
    output_buffer.should have_tag("div.progress.progress-striped")
  end

  it 'stores sets the types of the progress bar' do
    concat bootstrap_progress_bar_tag(40, :type => [:striped, :warning])
    output_buffer.should have_tag("div.progress.progress-striped.progress-warning")
  end

  it 'stores sets the active flag of the progress bar' do
    concat bootstrap_progress_bar_tag(40, :active => true)
    output_buffer.should have_tag("div.progress.active")
  end
end
