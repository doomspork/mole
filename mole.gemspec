# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mole/version'

Gem::Specification.new do |spec|
  spec.name          = 'mole'
  spec.version       = Mole::VERSION
  spec.authors       = ['Sean Callan']
  spec.email         = ['seancallan@gmail.com']
  spec.summary       = 'A client library for Orwell' 
  spec.description   = 'Mole allows developers to send events from within their code directly to Orwell.'  
  spec.homepage      = 'http://www.orwell.io'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',    '~> 1.7'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'rspec',      '~> 3.1'
  spec.add_development_dependency 'rspec-its',  '~> 1.0'
  spec.add_development_dependency 'rr',         '~> 1.1'
  spec.add_development_dependency 'coveralls',  '~> 0.7'
  spec.add_development_dependency 'simplecov',  '~> 0.9'
end
