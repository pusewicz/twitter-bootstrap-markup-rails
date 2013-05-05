# Twitter Bootstrap 2.0 Markup for Rails

<table>
    <tr>
        <th>Version</th>
        <td>v0.3.2.2</td>
    </tr>
    <tr>
        <th>Build Status</th>
        <td><a href="http://travis-ci.org/pusewicz/twitter-bootstrap-markup-rails"><img src="https://secure.travis-ci.org/pusewicz/twitter-bootstrap-markup-rails.png"></a></td>
    </tr>
    <tr>
        <th>Dependency Status</th>
        <td><a href="https://gemnasium.com/pusewicz/twitter-bootstrap-markup-rails"><img src="https://gemnasium.com/pusewicz/twitter-bootstrap-markup-rails.png"></a></td>
    </tr>
    <tr>
        <th>Changelog</th>
        <td><a href="https://github.com/pusewicz/twitter-bootstrap-markup-rails/wiki/Changelog">Changelog</a></td>
    </tr>
</table>

This gem focuses on making it easier to use Twitter's Bootstrap 2.0. It's a collection of helpers which should make it faster to use all the components provided by Twitter Bootstrap.


## Installation

Add to your `Gemfile`:

```ruby
gem 'twitter-bootstrap-markup-rails', '0.3.2.2'
```

## Currently Supported

* Alert messages
* Inline labels
* Buttons
* Button dropdowns
* Modal windows
* Progress bars
* Icons

Documentation
---

Documentation is available on [RubyDoc](http://rubydoc.info/github/pusewicz/twitter-bootstrap-markup-rails).

Examples
---

### Rendering Alert

```ruby
bootstrap_alert_tag("Hello!")
# => '<div class="alert"><a class="close">×</a>Hello!</div>'
```

### Rendering Info Block Alert

```ruby
bootstrap_alert_info_block_tag("Hello!")
# => '<div class="alert alert-block alert-info"><a class="close">×</a>Hello!</div>'
```

Same with basic helper:

```ruby
bootstrap_alert_tag("Hello!", :block => true, :type => "info")
# => '<div class="alert alert-block alert-info"><a class="close">×</a>Hello!</div>'
```

Add Alert heading:

```ruby
bootstrap_alert_tag("Hello!", :heading => "Hola!")
# => '<div class="alert"><a class="close">×</a><strong>Hola!</strong>Hello!</div>'
```

### Notice Inline Label

```ruby
bootstrap_inline_label_notice_tag("Info")
# => '<span class="label notice">Info</span>'
```

### Buttons

```ruby
bootstrap_button("Button Text", "#")
# => '<a class="btn" href="#">Button Text</a>'
```

### Dropdown Buttons

```ruby
bootstrap_button_dropdown do |b|
    b.bootstrap_button "Button Title", "#"
    b.link_to "First Dropdown Item", @item
    b.link_to "Second Dropdown Item", @item2
end
#  => '<div class="btn-group">
#        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
#          Button Title
#          <span class="caret"></span>
#        </a>
#        <ul class="dropdown-menu">
#          <!-- dropdown menu links -->
#        </ul>
#      </div>'
```

### Navigation lists

### Basic tabs example

```ruby
bootstrap_navigation do |nav|
  nav.link_to "Nav1", "/link1", :active_nav => true
  nav.link_to "Nav2", "/link2"
end
# => '<ul class="nav nav-tabs">
#       <li class="active">
#         <a href="/link1">Nav1</a>
#       </li>
#       <li>
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Basic pills example

```ruby
bootstrap_navigation(:type => "pills") do |nav|
  nav.link_to "Nav1", "/link1"
  nav.link_to "Nav2", "/link2", :active_nav => true
end
# => '<ul class="nav nav-pills">
#       <li>
#         <a href="/link1">Nav1</a>
#       </li>
#       <li class="active">
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Stacked tabs example

```ruby
bootstrap_navigation(:type => "tabs", :stacked => true) do |nav|
  nav.link_to "Nav1", "/link1", :active_nav => true
  nav.link_to "Nav2", "/link2"
end
# => '<ul class="nav nav-tabs nav-stacked">
#       <li class="active">
#         <a href="/link1">Nav1</a>
#       </li>
#       <li>
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Stacked pills example

```ruby
bootstrap_navigation(:type => "pills", :stacked => true) do |nav|
  nav.link_to "Nav1", "/link1"
  nav.link_to "Nav2", "/link2", :active_nav => true
end
# => '<ul class="nav nav-pills nav-stacked">
#       <li>
#         <a href="/link1">Nav1</a>
#       </li>
#       <li class="active">
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Modal popup example

```ruby
bootstrap_modal(dom_id: 'a_dom_id', fade: true, header_title: "I'm a bootstrap modal popup") do |modal|
  modal.body do |c|
   c.content_tag :div, "the body"
  end
  modal.footer do |f|
    f.bootstrap_button "Save", "/link1", :type => 'btn-primary'
    f.bootstrap_button "Cancel", "/link2"
  end
end
# => '<div class="modal fade" id="a_dom_id">
#       <div class="modal-header">
#         <a class="close" data-dismiss="modal">&times</a>
#         <h3>I'm a bootstrap modal popup</h3>
#       </div>
#       <div class="modal-body">
#         <div>the body</div>
#       </div>
#       <div class="modal-footer">
#         <a class="btn btn-primary" href="/link1">Save</a>
#         <a class="btn" href="/link2">Cancel</a></div>
#       </div>
#     </div>'
```

Plugins
---

### For [SimpleNavigation](https://github.com/andi/simple-navigation)

If you are using `simple-navigation` gem you can use the navigation renderer like this:

```ruby
render_navigation(level: 1..2, renderer: :bootstrap_topbar_list, expand_all: true)
```

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
* Rubinius
