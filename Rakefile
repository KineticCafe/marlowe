# frozen_string_literal: true

require "rubygems"
require "hoe"
require "rake/clean"

Hoe.plugin :doofus
Hoe.plugin :email unless ENV["CI"]
Hoe.plugin :gemspec2
Hoe.plugin :git
Hoe.plugin :minitest
Hoe.plugin :rubygems

spec = Hoe.spec "marlowe" do
  developer("Trevor Oke", "toke@kineticcafe.com")
  developer("Kinetic Cafe", "dev@kineticcafe.com")

  self.history_file = "History.md"
  self.readme_file = "README.rdoc"

  license "MIT"

  require_ruby_version ">= 2.0", "< 4"

  extra_deps << ["request_store", "~> 1.2"]
  extra_deps << ["rack", ">= 1", "< 4"]

  extra_dev_deps << ["appraisal", "~> 2.1"]
  extra_dev_deps << ["hoe-doofus", "~> 1.0"]
  extra_dev_deps << ["hoe-gemspec2", "~> 1.1"]
  extra_dev_deps << ["hoe-git", "~> 1.6"]
  extra_dev_deps << ["hoe-rubygems", "~> 1.0"]
  extra_dev_deps << ["minitest", "~> 5.4"]
  extra_dev_deps << ["minitest-autotest", "~> 1.0"]
  extra_dev_deps << ["minitest-bonus-assertions", "~> 3.0"]
  extra_dev_deps << ["minitest-focus", "~> 1.1"]
  extra_dev_deps << ["minitest-moar", "~> 0.0"]
  extra_dev_deps << ["rack-test", "~> 2.0"]
  extra_dev_deps << ["rake", ">= 10.0", "< 14"]
  extra_dev_deps << ["rdoc", ">= 4.2"]
  extra_dev_deps << ["standard", "~> 1.0"]
  extra_dev_deps << ["simplecov", "~> 0.21"]
  extra_dev_deps << ["psych", "~> 3.1"]
end

ENV["RUBYOPT"] = "-W0"

module Hoe::Publish # :nodoc:
  alias_method :__make_rdoc_cmd__marlowe__, :make_rdoc_cmd

  def make_rdoc_cmd(*extra_args) # :nodoc:
    spec.extra_rdoc_files.reject! { |f| f == "Manifest.txt" }
    __make_rdoc_cmd__marlowe__(*extra_args)
  end
end

if File.exist?(".simplecov-prelude.rb")
  namespace :test do
    task :coverage do
      spec.test_prelude = 'load ".simplecov-prelude.rb"'
      Rake::Task["test"].execute
    end

    CLOBBER << "coverage"
  end
end

CLOBBER << "tmp"
