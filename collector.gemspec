# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collector/version'

Gem::Specification.new do |spec|
  spec.name          = 'collector'
  spec.version       = Version::VERSION
  spec.authors       = ['Justin Commu']
  spec.email         = ['Justin.Commu@loblaw.ca']
  spec.summary       = 'Logging tool which accepts Hashes, Arrays, and Strings'
  spec.description   = 'Use this library effectively log different data types'
  spec.homepage      = 'https://loblawdigital.ca'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.platform      = Gem::Platform::RUBY
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

end


