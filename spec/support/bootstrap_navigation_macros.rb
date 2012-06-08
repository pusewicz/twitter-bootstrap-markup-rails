module BootstrapNavigationMacros
  def build_bootstrap_navigation(options = {}, &block)
    nav = bootstrap_navigation(options) do |d|
      block.call d
    end
    concat nav
  end
end
