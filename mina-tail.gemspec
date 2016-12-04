# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/tail/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-tail"
  spec.version       = Mina::Tail::VERSION
  spec.authors       = ["Daniel Senff"]
  spec.email         = ["daniel.senff@modomoto.de"]
  spec.summary       = %q{Tasks for tailing Rails log files in a Mina deployment environment.}
  spec.description   = %q{Tasks for tailing log files with mina.}
  spec.homepage      = "http://github.com/modomoto/mina-tail"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mina", "~> 1.0.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
end
