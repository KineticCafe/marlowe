# -*- encoding: utf-8 -*-
# stub: marlowe 3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "marlowe".freeze
  s.version = "3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "documentation_uri" => "http://www.rubydoc.info/github/KineticCafe/marlowe/master", "source_code_uri" => "https://github.com/KineticCafe/marlowe/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Trevor Oke".freeze, "Kinetic Cafe".freeze]
  s.date = "2024-02-27"
  s.description = "{Marlowe}[https://github.com/KineticCafe/marlowe] is a Rack middleware that\nextracts or creates a request ID using a pre-defined header, permitting request\ncorrelation across multiple services.\n\nWhen using Rails, Marlowe automatically adds itself to the middleware before\n<tt>Rails::Rack::Logger</tt>.\n\nAs of Marlowe 3.0, a Faraday middleware is provided (<tt>require 'marlowe/faraday'</tt>).".freeze
  s.email = ["toke@kineticcafe.com".freeze, "dev@kineticcafe.com".freeze]
  s.extra_rdoc_files = ["Contributing.md".freeze, "History.md".freeze, "Licence.md".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = [".github/workflows/ruby.yml".freeze, ".standard.yml".freeze, "Contributing.md".freeze, "History.md".freeze, "Licence.md".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "Rakefile".freeze, "lib/marlowe.rb".freeze, "lib/marlowe/config.rb".freeze, "lib/marlowe/faraday.rb".freeze, "lib/marlowe/formatter.rb".freeze, "lib/marlowe/middleware.rb".freeze, "lib/marlowe/rails.rb".freeze, "lib/marlowe/simple_formatter.rb".freeze, "test/minitest_config.rb".freeze, "test/test_marlowe.rb".freeze, "test/test_marlowe_config.rb".freeze]
  s.homepage = "https://github.com/KineticCafe/marlowe/".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.0".freeze, "< 4".freeze])
  s.rubygems_version = "3.4.10".freeze
  s.summary = "{Marlowe}[https://github.com/KineticCafe/marlowe] is a Rack middleware that extracts or creates a request ID using a pre-defined header, permitting request correlation across multiple services".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<request_store>.freeze, ["~> 1.2"])
  s.add_runtime_dependency(%q<rack>.freeze, [">= 1", "< 4"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.22"])
  s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.1"])
  s.add_development_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
  s.add_development_dependency(%q<hoe-git2>.freeze, ["~> 1.7"])
  s.add_development_dependency(%q<hoe-rubygems>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<minitest-autotest>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
  s.add_development_dependency(%q<minitest-moar>.freeze, ["~> 0.0"])
  s.add_development_dependency(%q<rack-test>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 10.0", "< 14"])
  s.add_development_dependency(%q<standard>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21"])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
  s.add_development_dependency(%q<hoe>.freeze, ["~> 4.2"])
end
