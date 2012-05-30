require 'spec_helper'

describe Twitter::Bootstrap::Markup::Rails::Helpers::ProgressBarHelpers do
  include BootstrapSpecHelper

  before do
    @output_buffer = ''
  end

  it 'should create a bar with the progress class' do
    concat bootstrap_progress_bar(40)
    output_buffer.should have_tag(div.progress)
  end

  it 'should have the correct width' do
    concat boostrap_progress_bar(40)
    output_bufffer.should have_tag(div, :style => 'width: 40%;')
  end
end
