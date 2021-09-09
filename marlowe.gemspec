# stub: marlowe 2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "marlowe".freeze
  s.version = "2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Trevor Oke".freeze, "Kinetic Cafe".freeze]
  s.description = "{Marlowe}[https://github.com/KineticCafe/marlowe] is a Rack middleware that\nextracts or creates a request ID using a pre-defined header, permitting request\ncorrelation across multiple services.\n\nWhen using Rails, Marlowe automatically adds itself to the middleware before\n<tt>Rails::Rack::Logger</tt>.".freeze
  s.email = ["toke@kineticcafe.com".freeze, "dev@kineticcafe.com".freeze]
  s.extra_rdoc_files = ["Contributing.md".freeze, "History.md".freeze, "Licence.md".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = ["Contributing.md".freeze, "History.md".freeze, "Licence.md".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "Rakefile".freeze, "lib/marlowe.rb".freeze, "lib/marlowe/formatter.rb".freeze, "lib/marlowe/middleware.rb".freeze, "lib/marlowe/rails.rb".freeze, "lib/marlowe/simple_formatter.rb".freeze, "test/minitest_config.rb".freeze, "test/test_marlowe.rb".freeze]
  s.homepage = "https://github.com/KineticCafe/marlowe/".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "{Marlowe}[https://github.com/KineticCafe/marlowe] is a Rack middleware that extracts or creates a request ID using a pre-defined header, permitting request correlation across multiple services".freeze

  if s.respond_to? :specification_version
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency
    s.add_runtime_dependency("request_store".freeze, ["~> 1.2"])
    s.add_runtime_dependency("rack".freeze, [">= 0.9", "< 3"])
    s.add_development_dependency("minitest".freeze, ["~> 5.11"])
    s.add_development_dependency("appraisal".freeze, ["~> 2.1"])
    s.add_development_dependency("hoe-doofus".freeze, ["~> 1.0"])
    s.add_development_dependency("hoe-gemspec2".freeze, ["~> 1.1"])
    s.add_development_dependency("hoe-git".freeze, ["~> 1.6"])
    s.add_development_dependency("hoe-rubygems".freeze, ["~> 1.0"])
    s.add_development_dependency("hoe-travis".freeze, ["~> 1.2"])
    s.add_development_dependency("minitest-autotest".freeze, ["~> 1.0"])
    s.add_development_dependency("minitest-bonus-assertions".freeze, ["~> 2.0"])
    s.add_development_dependency("minitest-focus".freeze, ["~> 1.1"])
    s.add_development_dependency("minitest-moar".freeze, ["~> 0.0"])
    s.add_development_dependency("rack-test".freeze, ["~> 0.6"])
    s.add_development_dependency("rake".freeze, [">= 10.0", "< 12"])
    s.add_development_dependency("rdoc".freeze, ["~> 4.2"])
    s.add_development_dependency("standard".freeze, ["~> 1.0"])
    s.add_development_dependency("coveralls".freeze, ["~> 0.8"])
    s.add_development_dependency("simplecov".freeze, ["~> 0.7"])
    s.add_development_dependency("hoe".freeze, ["~> 3.17"])
  else
    s.add_dependency("request_store".freeze, ["~> 1.2"])
    s.add_dependency("rack".freeze, [">= 0.9", "< 3"])
    s.add_dependency("minitest".freeze, ["~> 5.11"])
    s.add_dependency("appraisal".freeze, ["~> 2.1"])
    s.add_dependency("hoe-doofus".freeze, ["~> 1.0"])
    s.add_dependency("hoe-gemspec2".freeze, ["~> 1.1"])
    s.add_dependency("hoe-git".freeze, ["~> 1.6"])
    s.add_dependency("hoe-rubygems".freeze, ["~> 1.0"])
    s.add_dependency("hoe-travis".freeze, ["~> 1.2"])
    s.add_dependency("minitest-autotest".freeze, ["~> 1.0"])
    s.add_dependency("minitest-bonus-assertions".freeze, ["~> 2.0"])
    s.add_dependency("minitest-focus".freeze, ["~> 1.1"])
    s.add_dependency("minitest-moar".freeze, ["~> 0.0"])
    s.add_dependency("rack-test".freeze, ["~> 0.6"])
    s.add_dependency("rake".freeze, [">= 10.0", "< 12"])
    s.add_dependency("rdoc".freeze, ["~> 4.2"])
    s.add_dependency("standard".freeze, ["~> 1.0"])
    s.add_dependency("coveralls".freeze, ["~> 0.8"])
    s.add_dependency("simplecov".freeze, ["~> 0.7"])
    s.add_dependency("hoe".freeze, ["~> 3.17"])
  end
end
