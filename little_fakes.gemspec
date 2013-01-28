# -*- encoding: utf-8 -*-
require File.expand_path('../lib/little_fakes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Blackburn"]
  gem.email         = ["chris@midwiretech.com"]
  gem.description   = %q{TODO: A simple mocking library for SSH sessions}
  gem.summary       = %q{TODO: A simple mocking library for SSH sessions}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "little_fakes"
  gem.require_paths = ["lib"]
  gem.version       = LittleFakes::VERSION

  gem.add_runtime_dependency "midwire_common"
end
