# frozen_string_literal: true

require 'simplecov'

if ENV['CI'] || ENV['COVERALLS']
  require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

SimpleCov.start do
  command_name 'Minitest'
  add_filter '/test/'
end

gem 'minitest'
