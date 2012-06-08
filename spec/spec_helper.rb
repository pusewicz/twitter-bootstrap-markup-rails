# encoding: utf-8

if RUBY_VERSION =~ /^1\.9/
  require 'simplecov'
  ENV["COVERAGE"] && SimpleCov.start
end

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/twitter-bootstrap-markup-rails'))
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/twitter-bootstrap-markup-rails/engine'))

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each {|f| require f}
