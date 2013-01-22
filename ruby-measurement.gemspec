# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-measurement/version'

Gem::Specification.new do |gem|
  gem.name          = 'ruby-measurement'
  gem.version       = Measurement::VERSION
  gem.author        = 'Matt Huggins'
  gem.email         = 'matt.huggins@gmail.com'
  gem.description   = 'Simple gem for calculating and converting measurements'
  gem.summary       = 'Simple gem for calculating and converting measurements'
  gem.homepage      = 'https://github.com/mhuggins/measurement'
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_path  = 'lib'
  
  gem.add_development_dependency 'rake'
end
