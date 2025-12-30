
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "imdb_apios/version"

Gem::Specification.new do |spec|
  spec.name          = "imdb_apios"
  spec.version       = ImdbApios::VERSION
  spec.authors       = ["raj"]
  spec.email         = ["raj.deenoo@gmail.com"]

  spec.summary       = "ruby IMDB client"
  spec.description   = "IMDB client using the IMDB json web service made available for their iOS app."
  spec.homepage      = "https://github.com/raj/imdb-apios"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "base64"
  spec.add_development_dependency "bundler", ">= 2.3"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0"

end
