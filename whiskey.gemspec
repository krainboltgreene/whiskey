# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whiskey/version"

Gem::Specification.new do |spec|
  spec.name          = "whiskey"
  spec.version       = Whiskey::VERSION
  spec.authors       = ["Kurtis Rainbolt-Greene"]
  spec.email         = ["me@kurtisrainboltgreene.name"]
  spec.summary       = %q{A simple MUTE Engine}
  spec.description   = spec.summary
  spec.homepage      = "http://krainboltgreene.github.com/whiskey"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", "~> 3.2"
  spec.add_runtime_dependency "activesupport", "~> 3.2"
  spec.add_runtime_dependency "moneta", "~> 0.7"
  spec.add_runtime_dependency "celluloid-io", "~> 0.12"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "kramdown"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "coveralls"
end
