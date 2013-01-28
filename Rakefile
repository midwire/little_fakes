#!/usr/bin/env rake
require "bundler/gem_tasks"

begin
  require "midwire_common/rake_tasks"
rescue Exception => e
  puts ">>> You have to run that under 'bundle exec'"
  exit
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec
