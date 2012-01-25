# encoding: utf-8
require 'bundler/setup'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/twitter-bootstrap-markup-rails'))
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/twitter-bootstrap-markup-rails/engine'))

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each {|f| require f}
