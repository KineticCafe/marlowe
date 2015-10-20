lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = "marlowe"
  s.version       = "1.0.0"
  s.authors       = ["Trevor Oke", "Kinetic Cafe ALDO Team"]
  s.email         = ["toke@kineticcafe.com", "dev@kineticcafe.com"]
  s.description   = %q{Provides a correlation id header for Rails and Rack applications to correlate requests across multiple services.}
  s.summary       = %q{Correlation IDs for Rails and other Rack applications}
  s.homepage      = "http://example.com" # set to actual value  FIX
  s.license       = "MIT"

  s.extra_rdoc_files = ["History.rdoc", "Manifest.txt", "README.rdoc"]

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 2.0.0"

  s.add_dependency "rack", ">= 0.9.0"
  s.add_dependency "request_store", '>= 1.2'
end
