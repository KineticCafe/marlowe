# -*- encoding: utf-8 -*-
# stub: marlowe 2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "marlowe"
  s.version = "2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Trevor Oke", "Kinetic Cafe"]
  s.date = "2016-11-17"
  s.description = "{Marlowe}[https://github.com/KineticCafe/marlowe] is a Rack middleware that\nextracts or creates a request ID using a pre-defined header, permitting request\ncorrelation across multiple services.\n\nWhen using Rails, Marlowe automatically adds itself to the middleware before\n<tt>Rails::Rack::Logger</tt>."
  s.email = ["toke@kineticcafe.com", "dev@kineticcafe.com"]
  s.extra_rdoc_files = ["Contributing.md", "History.md", "Licence.md", "Manifest.txt", "README.rdoc"]
  s.files = ["Contributing.md", "History.md", "Licence.md", "Manifest.txt", "README.rdoc", "Rakefile", "lib/marlowe.rb", "lib/marlowe/formatter.rb", "lib/marlowe/middleware.rb", "lib/marlowe/rails.rb", "lib/marlowe/simple_formatter.rb", "test/minitest_config.rb", "test/test_marlowe.rb"]
  s.homepage = "https://github.com/KineticCafe/marlowe/"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0"), Gem::Requirement.new("< 4")
  s.rubygems_version = "2.5.1"
  s.summary = "{Marlowe}[https://github.com/KineticCafe/marlowe] is a Rack middleware that extracts or creates a request ID using a pre-defined header, permitting request correlation across multiple services"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<request_store>, ["~> 1.2"])
      s.add_runtime_dependency(%q<rack>, ["< 3", ">= 0.9"])
      s.add_development_dependency(%q<minitest>, ["~> 5.9"])
      s.add_development_dependency(%q<appraisal>, ["~> 2.1"])
      s.add_development_dependency(%q<hoe-doofus>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
      s.add_development_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_development_dependency(%q<hoe-rubygems>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-travis>, ["~> 1.2"])
      s.add_development_dependency(%q<minitest-autotest>, ["~> 1.0"])
      s.add_development_dependency(%q<minitest-bonus-assertions>, ["~> 2.0"])
      s.add_development_dependency(%q<minitest-focus>, ["~> 1.1"])
      s.add_development_dependency(%q<minitest-moar>, ["~> 0.0"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.6"])
      s.add_development_dependency(%q<rake>, ["< 12", ">= 10.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.2"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.32"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_development_dependency(%q<hoe>, ["~> 3.15"])
    else
      s.add_dependency(%q<request_store>, ["~> 1.2"])
      s.add_dependency(%q<rack>, ["< 3", ">= 0.9"])
      s.add_dependency(%q<minitest>, ["~> 5.9"])
      s.add_dependency(%q<appraisal>, ["~> 2.1"])
      s.add_dependency(%q<hoe-doofus>, ["~> 1.0"])
      s.add_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
      s.add_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_dependency(%q<hoe-rubygems>, ["~> 1.0"])
      s.add_dependency(%q<hoe-travis>, ["~> 1.2"])
      s.add_dependency(%q<minitest-autotest>, ["~> 1.0"])
      s.add_dependency(%q<minitest-bonus-assertions>, ["~> 2.0"])
      s.add_dependency(%q<minitest-focus>, ["~> 1.1"])
      s.add_dependency(%q<minitest-moar>, ["~> 0.0"])
      s.add_dependency(%q<rack-test>, ["~> 0.6"])
      s.add_dependency(%q<rake>, ["< 12", ">= 10.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.2"])
      s.add_dependency(%q<rubocop>, ["~> 0.32"])
      s.add_dependency(%q<coveralls>, ["~> 0.8"])
      s.add_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_dependency(%q<hoe>, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<request_store>, ["~> 1.2"])
    s.add_dependency(%q<rack>, ["< 3", ">= 0.9"])
    s.add_dependency(%q<minitest>, ["~> 5.9"])
    s.add_dependency(%q<appraisal>, ["~> 2.1"])
    s.add_dependency(%q<hoe-doofus>, ["~> 1.0"])
    s.add_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
    s.add_dependency(%q<hoe-git>, ["~> 1.6"])
    s.add_dependency(%q<hoe-rubygems>, ["~> 1.0"])
    s.add_dependency(%q<hoe-travis>, ["~> 1.2"])
    s.add_dependency(%q<minitest-autotest>, ["~> 1.0"])
    s.add_dependency(%q<minitest-bonus-assertions>, ["~> 2.0"])
    s.add_dependency(%q<minitest-focus>, ["~> 1.1"])
    s.add_dependency(%q<minitest-moar>, ["~> 0.0"])
    s.add_dependency(%q<rack-test>, ["~> 0.6"])
    s.add_dependency(%q<rake>, ["< 12", ">= 10.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.2"])
    s.add_dependency(%q<rubocop>, ["~> 0.32"])
    s.add_dependency(%q<coveralls>, ["~> 0.8"])
    s.add_dependency(%q<simplecov>, ["~> 0.7"])
    s.add_dependency(%q<hoe>, ["~> 3.15"])
  end
end
