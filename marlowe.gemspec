lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = "marlowe"
  s.version       = "1.0.2"
  s.authors       = ["Trevor Oke", "Kinetic Cafe ALDO Team"]
  s.email         = ["toke@kineticcafe.com", "dev@kineticcafe.com"]
  s.description   = %q{Provides a correlation id header for Rails and Rack applications to correlate requests across multiple services.}
  s.summary       = %q{Correlation IDs for Rails and other Rack applications}
  s.homepage      = "https://github.com/KineticCafe/marlowe" 
  s.license       = "MIT"

  s.extra_rdoc_files = ["History.rdoc", "Manifest.txt", "README.rdoc", "Licence.rdoc"]

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 2.0.0"
  
  s.add_development_dependency('minitest', '~> 5.7')
  s.add_development_dependency('minitest-autotest', '~> 1.0')
  s.add_development_dependency('minitest-focus', '~> 1.1')
  s.add_development_dependency('minitest-moar', '~> 0.0')
  s.add_development_dependency('minitest-bisect', '~> 1.2')
  s.add_development_dependency('minitest-pretty_diff', '~> 0.1')
  s.add_development_dependency('rack-test', '~> 0.6')
  s.add_development_dependency('pry')


  s.add_development_dependency('rdoc', '~> 4.0')
  s.add_development_dependency('hoe', '~> 3.13')


  s.add_dependency "rack", ">= 0.9.0"
  s.add_dependency "request_store", '>= 1.2'
end
