# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter-bootstrap-markup-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Usewicz"]
  gem.email         = ["piotr@layer22.com"]
  gem.description   = %q{Ruby on Rails helpers for HTML, CSS, and JS toolkit from Twitter}
  gem.summary       = %q{Ruby on Rails helpers for HTML, CSS, and JS toolkit from Twitter}
  gem.homepage      = "https://github.com/pusewicz/twitter-bootstrap-markup-rails"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "twitter-bootstrap-markup-rails"
  gem.require_paths = ["lib"]
  gem.version       = Twitter::Bootstrap::Markup::Rails::VERSION

  #gem.add_dependency "railties", "~> 3.0"
  #gem.add_development_dependency "bundler", ">= 1.0.0"
  #gem.add_development_dependency "rails",   "~> 3.0"
end

