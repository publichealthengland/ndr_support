# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ndr_support/version'

Gem::Specification.new do |spec|
  spec.name          = 'ndr_support'
  spec.version       = NdrSupport::VERSION
  spec.authors       = ['NCRS Development Team']
  spec.email         = []
  spec.summary       = 'NDR Support library'
  spec.description   = 'Provides NDR classes and class extensions'
  spec.homepage      = ''

  # Exclude older versions of this gem from the package.
  spec.files         = `git ls-files -z`.split("\x0").reject{|s| s=~ /^pkg\//}
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '~> 3.2.18'
  spec.add_dependency 'activesupport', '~> 3.2.18'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'mocha', '~> 1.1'

  # TODO: once we're on 1.9.3 everywhere, uncomment, and remove YAML cruft.
  # spec.required_ruby_version = '>= 1.9.3'

  if RUBY_VERSION == '1.8.7'
    # FIXME: For Josh, bundle won't install on 1.8.7 without this
    spec.add_development_dependency 'i18n', '0.6.9'
  else
    spec.add_development_dependency 'guard'
    spec.add_development_dependency 'guard-rubocop'
    spec.add_development_dependency 'guard-test'
    spec.add_development_dependency 'terminal-notifier-guard' if RUBY_PLATFORM =~ /darwin/
  end
end
