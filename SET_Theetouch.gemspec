
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "SET_Theetouch/version"

Gem::Specification.new do |spec|
  spec.name          = "SET_Theetouch"
  spec.version       = SETTheetouch::VERSION
  spec.authors       = ["Theetouch Kasemarnontana"]
  spec.email         = ["58279552+lisbono2001@users.noreply.github.com"]

  spec.summary       = %q{TODO: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "httparty" "~>0.18.1"
  spec.add_dependency "nokogiri" "~>1.10.1"
  spec.add_dependency "byebug" "~>11.1.3"
end
