#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'rake/testtask'


begin
  require 'yard'
  require 'yard/rake/yardoc_task'
  desc 'Generate docs'
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb']
  end
rescue Exception
  puts "No yard gem available"
end

task :default => :spec

desc 'Test the plugin.'
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
end
