module BootstrapButtonMacros
  def build_bootstrap_button_dropdown(&block)
    dropdown = bootstrap_button_dropdown do |d|
      block.call d
    end
    concat dropdown
  end
end