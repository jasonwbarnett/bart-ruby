# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require "bart/version"
Gem::Specification.new do |s|
  s.name = "bart-ruby"
  s.version = Bart::VERSION
  s.description = "The unofficial library for communicating with the Bart REST API"
  s.summary = s.description
  s.authors = ["Jason Barnett"]
  s.homepage = "https://github.com/jasonwbarnett/bart-ruby"
  s.license = "MIT"
  s.required_ruby_version = ">= 2.3"

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.0.0"
  s.extra_rdoc_files = ["README.md", "LICENSE"]

  s.add_dependency "faraday", "~> 0.9"
  s.add_dependency "faraday_middleware", "~> 0.8"

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-rubocop"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-performance"
  s.add_development_dependency "rubocop-rspec"
end
