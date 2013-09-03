# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chosen-koenpunt-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "chosen-koenpunt-rails"
  gem.version       = Chosen::Koenpunt::Rails::VERSION
  gem.authors       = ["tnarik"]
  gem.email         = ["tnarik@gmail.com"]
  gem.description   = %q{Integrate Koenpunt branch of the Chosen javascript library with the Rails asset pipeline}
  gem.summary       = %q{Integrate Koenpunt branch of the Chosen javascript library with the Rails asset pipeline}
  gem.homepage      = ""

  gem.files         = Dir['vendor/**/*'] + Dir['lib/**/*'] + %w( README.md LICENSE.txt)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # development dependencies
  gem.add_development_dependency "coffee-script"
  gem.add_development_dependency "sass", '~>3.1'  
  gem.add_development_dependency "sass-rails", '~>4.0'
  gem.add_development_dependency "compass-rails"
  gem.add_development_dependency "sprockets", '~>2.0'
  gem.add_development_dependency "bundler", "~> 1.3"
end
