# -*- encoding: utf-8 -*-
require File.expand_path('../lib/little_fakes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Blackburn"]
  gem.email         = ["chris@midwiretech.com"]
  gem.description   = %q{A simple mocking library for SSH sessions}
  gem.summary       = %q{A simple mocking library for SSH sessions}
  gem.homepage      = "https://github.com/midwire/little_fakes"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "little_fakes"
  gem.require_paths = ["lib"]
  gem.version       = LittleFakes::VERSION

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "growl"
  gem.add_development_dependency "rb-fsevent"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"

  gem.add_runtime_dependency "midwire_common"
  gem.add_runtime_dependency "net-ssh"
end
