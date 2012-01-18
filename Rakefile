#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'rake/testtask'
require 'yard'
require 'yard/rake/yardoc_task'

task :default => :spec

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc 'Test the plugin.'
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
end

desc 'Generate docs'
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  #t.options = ['--plugin', 'yard-tomdoc']
end

