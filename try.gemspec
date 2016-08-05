lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'try/version'

Gem::Specification.new do |spec|
  spec.name          = "try"
  spec.version       = Try::VERSION
  spec.authors       = ["John Olmsted"]
  spec.email         = ["johnaolmsted@gmail.com"]

  spec.summary       = "A Ruby implementation of Scala's Try monad"
  spec.homepage      = "https://github.com/qsymmachus/try"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
