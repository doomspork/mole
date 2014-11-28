# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orwell/mole/version'

Gem::Specification.new do |spec|
  spec.name          = 'orwell-mole'
  spec.version       = Mole::VERSION
  spec.authors       = ['Sean Callan']
  spec.email         = ['seancallan@gmail.com']
  spec.summary       = 'A client library for Orwell' 
  spec.description   = 'Mole allows you to send events to Orwell from within your applications.'  
  spec.homepage      = 'http://www.orwell.io'
  spec.license       = 'MIT'
  spec.files         = ['README.md', 'LICENSE'] + Dir['lib/**/*'] 
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',       '~> 1.7'
  spec.add_development_dependency 'coveralls',     '~> 0.7'
  spec.add_development_dependency 'pry',           '~> 0.10'
  spec.add_development_dependency 'pry-byebug',    '~> 2.0'
  spec.add_development_dependency 'rake',          '~> 10.0'
  spec.add_development_dependency 'rr',            '~> 1.1'
  spec.add_development_dependency 'rspec',         '~> 3.1'
  spec.add_development_dependency 'rspec-its',     '~> 1.0'
  spec.add_development_dependency 'sidekiq',       '~> 3.2'
  spec.add_development_dependency 'simplecov',     '~> 0.9'
  spec.add_development_dependency 'sucker_punch',  '~> 1.2'
  spec.add_development_dependency 'webmock',       '~> 1.18'

end
