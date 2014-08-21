# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-gitslave"
  spec.version       = "1.0.0"
  spec.authors       = ["Matthew Spence"]
  spec.email         = ["matt@trak.io"]
  spec.description   = "Gitslave support for Capistrano 3"
  spec.summary       = "Adds a Capistrano strategy for deploying repositories with Gitslave"
  spec.homepage      = "https://trak.io"
  spec.license       = "GNU General Public License V3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'

end
