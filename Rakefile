# frozen_string_literal: true

require 'rubygems'
require 'hoe'
require 'rake/clean'

Hoe.plugin :doofus
Hoe.plugin :email unless ENV['CI'] || ENV['TRAVIS']
Hoe.plugin :gemspec2
Hoe.plugin :git
Hoe.plugin :minitest
Hoe.plugin :rubygems
Hoe.plugin :travis

spec = Hoe.spec 'marlowe' do
  developer('Trevor Oke', 'toke@kineticcafe.com')
  developer('Kinetic Cafe', 'dev@kineticcafe.com')

  self.history_file = 'History.md'
  self.readme_file = 'README.rdoc'

  license 'MIT'

  ruby20!

  extra_deps << ['request_store', '~> 1.2']
  extra_deps << ['rack', '>= 0.9', '< 3']

  extra_dev_deps << ['appraisal', '~> 2.1']
  extra_dev_deps << ['hoe-doofus', '~> 1.0']
  extra_dev_deps << ['hoe-gemspec2', '~> 1.1']
  extra_dev_deps << ['hoe-git', '~> 1.6']
  extra_dev_deps << ['hoe-rubygems', '~> 1.0']
  extra_dev_deps << ['hoe-travis', '~> 1.2']
  extra_dev_deps << ['minitest', '~> 5.4']
  extra_dev_deps << ['minitest-autotest', '~> 1.0']
  extra_dev_deps << ['minitest-bonus-assertions', '~> 2.0']
  extra_dev_deps << ['minitest-focus', '~> 1.1']
  extra_dev_deps << ['minitest-moar', '~> 0.0']
  extra_dev_deps << ['rack-test', '~> 0.6']
  extra_dev_deps << ['rake', '>= 10.0', '< 12']
  extra_dev_deps << ['rdoc', '~> 4.2']
  extra_dev_deps << ['rubocop', '~> 0.32']
  extra_dev_deps << ['coveralls', '~> 0.8']
  extra_dev_deps << ['simplecov', '~> 0.7']
end

ENV['RUBYOPT'] = '-W0'

module Hoe::Publish #:nodoc:
  alias __make_rdoc_cmd__marlowe__ make_rdoc_cmd

  def make_rdoc_cmd(*extra_args) # :nodoc:
    spec.extra_rdoc_files.reject! { |f| f == 'Manifest.txt' }
    __make_rdoc_cmd__marlowe__(*extra_args)
  end
end

if File.exist?('.simplecov-prelude.rb')
  namespace :test do
    task :coverage do
      spec.test_prelude = 'load ".simplecov-prelude.rb"'
      Rake::Task['test'].execute
    end

    task :coveralls do
      ENV['coveralls'] = '1'
      Rake::Task['test:coverage'].execute
    end

    CLOBBER << 'coverage'
  end
end

CLOBBER << 'tmp'
