guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/.*(helpers|components)/(.+)\.rb$})    { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch(%r{^lib/(.+)\.rb$})                           { "spec" }
end
