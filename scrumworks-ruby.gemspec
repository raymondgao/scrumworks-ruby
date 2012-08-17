# -*- encoding: utf-8 -*-
require File.expand_path('../lib/scrumworks/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eric Barendt"]
  gem.email         = ["ebarendt@gmail.com"]
  gem.description   = %q{Handles communicating with a ScrumWorks server via its API.}
  gem.summary       = %q{Handles communicating with a ScrumWorks server via its API.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scrumworks-ruby"
  gem.require_paths = ["lib"]
  gem.version       = Scrumworks::VERSION

  gem.add_runtime_dependency "savon", ["~> 1.1.0"]
end
