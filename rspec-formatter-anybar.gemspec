# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/formatter/anybar/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-formatter-anybar"
  spec.version       = RSpec::Formatter::Anybar::VERSION
  spec.authors       = ["Sami Kukkonen"]
  spec.email         = ["sami@samikukkonen.fi"]

  spec.summary       = %q{AnyBar integration for Rspec}
  spec.homepage      = "https://github.com/strax/rspec-formatter-anybar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
end
