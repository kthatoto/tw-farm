
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "constants/version"

Gem::Specification.new do |spec|
  spec.name          = "twfarm"
  spec.version       = Twfarm::VERSION
  spec.authors       = ["kthatoto"]
  spec.email         = ["kthatoto@gmail.com"]

  spec.summary       = "Farm on Terminal World"
  spec.description   = "Farm on Terminal World"
  spec.homepage      = "https://github.com/twfarm"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor"
  spec.add_dependency "sqlite3", "~> 1.4.2"
end
