module BootstrapFormMacros
  def build_bootstrap_form(&block)
    form_builder = bootstrap_form_for 'object', :url => 'url' do |f|
      block.call f
    end
    concat form_builder
  end
end