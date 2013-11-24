#!/usr/bin/env ruby

lib = File.expand_path(File.join("..", "lib"), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whiskey/version"

Gem::Specification.new do |spec|

  spec.name = "whiskey"
  spec.version = Whiskey::VERSION
  spec.authors = ["Kurtis Rainbolt-Greene"]
  spec.email = ["me@kurtisrainboltgreene.name"]
  spec.summary = %q{A simple MUTE Engine}
  spec.description = spec.summary
  spec.homepage = "http://krainboltgreene.github.io/whiskey"
  spec.license = "MIT"

  spec.files = Dir[File.join("lib", "**", "*")]
  spec.executables = Dir[File.join("bin", "**", "*")].map! { |f| f.gsub(/bin\//, "") }
  spec.test_files = Dir[File.join("test", "**", "*"), File.join("spec", "**", "*")]
  spec.require_paths = ["lib"]

  # spec.add_runtime_dependency "activerecord", "~> 3.2"
  # spec.add_runtime_dependency "moneta", "~> 0.7"
  spec.add_runtime_dependency "activesupport", "~> 3.2"
  spec.add_runtime_dependency "celluloid-io", "~> 0.12"
  spec.add_runtime_dependency "multi_json", "~> 1.7"
  # spec.add_runtime_dependency "colored", "~> 1.2"
  spec.add_runtime_dependency "astruct", "~> 2.11"
  spec.add_runtime_dependency "thor", "~> 0.18"
  spec.add_runtime_dependency "parslet", "~> 1.5"
  spec.add_runtime_dependency "parslet-export", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-doc", "~> 0.6"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
