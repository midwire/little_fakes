if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter "spec/"
    add_filter "vendor/"
  end
end

require "pry"
require 'net/ssh'
require File.join(File.dirname(__FILE__), '..', 'lib', 'little_fakes')
require 'little_fakes'

RSpec.configure do |config|
  config.mock_with :rspec
  config.color_enabled = true
  config.include LittleFakes
end
