# Don't want to expose task that pushes to rubygems
# so load gem_helper functions instead
require 'bundler'
require './version'

require 'rspec/core'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Dir.glob('lib/tasks/*.rake').each { |r| load r }

RuboCop::RakeTask.new do |t|
  t.formatters = %w(progress json)
  t.options = %w(--out target/rubocop.json)
end

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task default: [:spec, :rubocop]
