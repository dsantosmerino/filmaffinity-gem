# frozen_string_literal: false

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'filmaffinity/version'

Gem::Specification.new do |gem|
  gem.name          = 'filmaffinity'
  gem.version       = FilmAffinity::VERSION
  gem.summary       = 'filmaffinity'
  gem.description   = 'Easily use Ruby or the command line to find information on Filmaffinity.com'
  gem.authors       = ['David Santos', 'Oriol Bellido']
  gem.email         = 'dsantosmerino@gmail.com'
  gem.files         = `git ls-files`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.homepage      = 'https://github.com/davidsantosmerino/filmaffinity-gem'
  gem.license       = 'MIT'
  gem.add_dependency 'imgur-api', '~> 0'
  gem.add_dependency 'json', '>= 1.8', '< 3.0'
  gem.add_dependency 'nokogiri', '>= 1.8.1'
  gem.add_development_dependency 'rake', '~> 12.3'
  gem.add_development_dependency 'rspec', '~> 3.3'
  gem.required_ruby_version = '>= 2.7.0'
  gem.metadata['rubygems_mfa_required'] = 'true'
end
