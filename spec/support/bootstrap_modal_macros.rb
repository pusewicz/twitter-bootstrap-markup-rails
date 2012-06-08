module BootstrapModalMacros
  def build_bootstrap_modal(options = {}, &block)
    nav = bootstrap_modal(options) do |d|
      block.call d
    end
    concat nav
  end
end
