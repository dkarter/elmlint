# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elmlint/version'

Gem::Specification.new do |spec|
  spec.name          = 'elmlint'
  spec.version       = ElmLint::VERSION
  spec.authors       = ['Dorian Karter']
  spec.email         = ['dkarter@gmail.com']

  spec.summary       = 'Lints Elm projects. For Vim and NeoMake.'
  spec.description   = 'A simple command line utility for linting Elm'
  spec.homepage      = 'https://doriankarter.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'rubocop', '~> 0.47.1'
end
