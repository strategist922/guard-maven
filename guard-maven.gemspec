# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard-maven/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Dugas"]
  gem.email         = ["scottd@ripariandata.com"]
  gem.description   = %q{Guard gem for maven}
  gem.summary       = %q{Guard::Maven automatically packages maven when files are changed}
  gem.homepage      = "https://github.com/RiparianData/guard-maven"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guard-maven"
  gem.require_paths = ["lib"]
  gem.platform      = Gem::Platform::RUBY
  gem.version       = Guard::Maven::VERSION
  gem.add_dependency 'guard', '~> 1.0.1'
end
