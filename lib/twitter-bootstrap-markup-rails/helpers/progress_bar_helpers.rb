module Twitter::Bootstrap::Markup::Rails::Helpers
  module ProgressBarHelpers
    # Render a bootstrap progress bar
    #
    # @param [Integer] width percent out of 100 progress on bar
    # @param [Hash] options hash containing options (default: {}):
    #           :type         - Additional progress type(s). For one, just specify a string, but
    #                           you can also pass an array (of sym or str) for multiple classes
    #           :html_options - Any additional options you'd like to pass to the content_tag that will be created
    #                           for this button's a tag (for instance :target can be specified in :html_options).
    #
    # Examples
    #
    #   bootstrap_progress_bar 40, :type => ['progress-info', 'progress-striped', 'active']
    #
    def bootstrap_progress_bar(width, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::ProgressBar.new(
        width,
        options
      ).to_s
    end
  end
end
