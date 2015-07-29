# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pully/version'

Gem::Specification.new do |gem|
  gem.name          = 'pully'
  gem.version       = Pully::VERSION
  gem.version       = "#{gem.version}-alpha-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
  gem.authors       = ['Dave Robertson']
  gem.email         = ['david.andrew.robertson.nz@gmail.com']
  gem.description   = 'Consumer Data EMR Tool'
  gem.summary       = 'Pull request creator on github or enterprise github'
  gem.homepage      = ''

  gem.add_runtime_dependency 'git'
  gem.add_runtime_dependency 'uri-ssh_git'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'codeclimate-test-reporter'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(?:test|spec|features)/})
  gem.require_paths = %w(lib)
end
