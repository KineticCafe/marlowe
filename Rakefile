# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :doofus
Hoe.plugin :email unless ENV['CI'] or ENV['TRAVIS']
Hoe.plugin :gemspec2
Hoe.plugin :git
Hoe.plugin :minitest
Hoe.plugin :rubygems
Hoe.plugin :travis

Hoe.spec 'marlowe' do
  developer('Trevor Oke', 'toke@kineticcafe.com')
  developer('Kinetic Cafe', 'dev@kineticcafe.com')

  self.history_file = 'History.rdoc'
  self.readme_file = 'README.rdoc'

  license 'MIT'

  extra_deps << ['request_store', '~> 1.2']
  extra_deps << ['rack',  '>= 0.9', '< 3']

  extra_dev_deps << ['rack-test', '~> 0.6']
  self.extra_dev_deps << ['rake', '~> 10.0']
  self.extra_dev_deps << ['hoe-doofus', '~> 1.0']
  self.extra_dev_deps << ['hoe-gemspec2', '~> 1.1']
  self.extra_dev_deps << ['hoe-git', '~> 1.5']
  self.extra_dev_deps << ['hoe-travis', '~> 1.2']
  self.extra_dev_deps << ['minitest', '~> 5.4']
  self.extra_dev_deps << ['minitest-autotest', '~> 1.0']
  self.extra_dev_deps << ['minitest-bisect', '~> 1.2']
  self.extra_dev_deps << ['minitest-focus', '~> 1.1']
  self.extra_dev_deps << ['minitest-moar', '~> 0.0']
  self.extra_dev_deps << ['simplecov', '~> 0.7']
end

module Hoe::Publish
  alias_method :original_make_rdoc_cmd, :make_rdoc_cmd

  def make_rdoc_cmd(*extra_args) # :nodoc:
    spec.extra_rdoc_files.reject! { |f| f == 'Manifest.txt' }
    original_make_rdoc_cmd(*extra_args)
  end
end

namespace :test do
  task :coverage do
    prelude = <<-EOS
require 'simplecov'
SimpleCov.start('test_frameworks') { command_name 'Minitest' }
gem 'minitest'
    EOS
    spec.test_prelude = prelude.split($/).join('; ')
    Rake::Task['test'].execute
  end
end

# vim: syntax=ruby
