# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module ModalHelpers

    # Render a modal popup
    #
    # @param [Hash] options hash containing options (default: { :dom_id => 'twitter-bootstrap-modal', :fade => false, :header_title => '' }):
    #            :dom_id       - DOM ID of the modal element (mandatory).
    #            :fade         - if true, add the fade class to the modal DOM element so the modal will be animated when shown.
    #            :header_title - modal title.
    #
    # @example
    #   bootstrap_modal(dom_id: 'a_dom_id', fade: true, header_title: "I'm a bootstrap modal popup") do |modal|
    #     modal.body do |c|
    #      c."some content"
    #     end
    #     modal.footer do |f|
    #       f.bootstrap_button "Save", "url", :type => 'btn-primary'
    #       f.bootstrap_button "Cancel", "url"
    #     end
    #   end
    #
    # @example With HAML
    #   =bootstrap_modal(dom_id: 'a_dom_id', fade: true, header_title: "I'm a bootstrap modal popup") do |modal|
    #     -modal.body do |c|
    #       -c.content_tag :div do
    #         %p="some text"
    #         %div.a_class="another_text"
    #         =link_to "link", "#"
    #     -modal.footer do |f|
    #       -f.bootstrap_button "Save", "url", :type => 'btn-primary'
    #       -f.bootstrap_button "Cancel", "url"
    #
    # @example To render the button to show the modal use:
    #   =bootstrap_button "Show Modal", "#a_dom_id", :html_options => {:"data-toggle" => "modal"}
    #
    # Returns HTML String for the modal popup
    
    def bootstrap_modal(options = {})
      elements = Twitter::Bootstrap::Markup::Rails::HelperCollectionSet.new(self, [:body, :footer])
      
      yield elements
      
      Twitter::Bootstrap::Markup::Rails::Components::Modal.new(
        elements.collections[:body],
        elements.collections[:footer],
        options
      ).to_s
    end
    
  end
end
