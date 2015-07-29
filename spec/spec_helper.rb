require 'rspec'
require 'pry'
require 'simplecov'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

SimpleCov.coverage_dir('target/coverage')

SimpleCov.start do
  add_filter 'spec'
end

require 'pully'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.expose_dsl_globally = true
  config.order = :random
end
