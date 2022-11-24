# frozen_string_literal: true

require_relative 'lib/csp/version'

Gem::Specification.new do |spec|
  spec.name          = 'icsp'
  spec.version       = ICSP::VERSION
  spec.authors       = ['Denis Semenenko']
  spec.email         = ['hypercoderx@gmail.com']

  spec.summary       = 'An interactive CryptoPro CSP shell'
  spec.description   = 'An interactive CryptoPro CSP shell that tries to imitate its GUI counterpart on the Windows platform.
Built for macOS and Linux daily use by wrapping a set of CryptoPro CLI tools: cryptcp, certmgr, csptest, cpconfig, etc.'
  spec.homepage      = 'https://github.com/denblackstache/icsp'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/denblackstache/icsp'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'os', '~> 1.1'
  spec.add_dependency 'tty-prompt', '~> 0.23.1'
end
