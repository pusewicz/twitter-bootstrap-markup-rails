module BootstrapButtonMacros
  def build_bootstrap_button_dropdown(options = {}, &block)
    dropdown = bootstrap_button_dropdown(options) do |d|
      block.call d
    end
    concat dropdown
  end
end