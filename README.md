Twitter Bootstrap 2.0 Markup for Rails [![Build Status](https://secure.travis-ci.org/pusewicz/twitter-bootstrap-markup-rails.png)](http://travis-ci.org/pusewicz/twitter-bootstrap-markup-rails) [![Dependency Status](https://gemnasium.com/pusewicz/twitter-bootstrap-markup-rails.png)](https://gemnasium.com/pusewicz/twitter-bootstrap-markup-rails)
===

This gem focuses on making it easier to use Twitter's Bootstrap 2.0. It's a collection of helpers which should make it faster to use all the components provided by Twitter Bootstrap.


Installation
---

Add to your `Gemfile`:

    gem "twitter-bootstrap-markup-rails", :git => "git://github.com/pusewicz/twitter-bootstrap-markup-rails.git"
    
Currently Supported
---

* Alert messages
* Inline labels

Documentation
---

Documentation is available on [RubyDoc](http://rubydoc.info/github/pusewicz/twitter-bootstrap-markup-rails).

Examples
---

Render Alert in your view:

    twitter_alert("Hello!")
    # => '<div class="alert"><a class="close">×</a>Hello!</div>'

Render Info Block Alert in your view:

    twitter_alert_info_block("Hello!")
    # => '<div class="alert alert-block alert-info"><a class="close">×</a>Hello!</div>'

Same with basic helper:

    twitter_alert("Hello!", :block => true, :type => "info")
    # => '<div class="alert alert-block alert-info"><a class="close">×</a>Hello!</div>'

Add Alert heading:

    twitter_alert("Hello!", :heading => "Hola!")
    # => '<div class="alert"><a class="close">×</a><strong>Hola!</strong>Hello!</div>'

Notice Inline Label:

    twitter_inline_label_notice("Info")
    # => '<span class="label notice">Info</span>'

Contributing
---

In the spirit of free software, everyone is encouraged to help improve this project.

Here are some ways you can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (no patch is too small: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by closing [issues](https://github.com/pusewicz/twitter-bootstrap-markup-rails/issues)
* by reviewing patches

Submitting an Issue
---

We use the [GitHub issue tracker](https://github.com/pusewicz/twitter-bootstrap-markup-rails/issues) to track bugs and features. Before submitting a bug report or feature request, check to make sure it hasn't already been submitted. You can indicate support for an existing issue by voting it up. When submitting a bug report, please include a [gist](https://gist.github.com/) that includes a stack trace and any details that may be necessary to reproduce the bug, including your gem version, Ruby version, and operating system. Ideally, a bug report should include a pull request with failing specs.

Submitting a Pull Request
---

1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run `bundle exec rake yard`. If your changes are not 100% documented, go back to step 4.
6. Add specs for your feature or bug fix.
7. Run `bundle exec rake spec`. If your changes are not 100% covered, go back to step 6.
8. Commit and push your changes.
9. Submit a pull request. Please do not include changes to the gemspec, version, or history file. (If you want to create your own version for some reason, please do so in a separate commit.)

Supported Ruby Versions
---

This library aims to support and is [tested against](http://travis-ci.org/pusewicz/twitter-bootstrap-markup-rails) the following Ruby implementations:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* Ruby Enterprise Edition
* Rubinius
* JRuby 
