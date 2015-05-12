# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_present/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_present'
  spec.version       = ActivePresent::VERSION
  spec.authors       = ["Ramón Soto"]
  spec.email         = ["ddsstr@gmail.com"]

  spec.summary       = %q{Presenters for rails.}
  spec.description   = %q{Presenters for rails.}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0.0'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'database_cleaner'

  spec.add_runtime_dependency 'rails', '~> 4.0'

  spec.required_ruby_version = '>= 2.0'
end