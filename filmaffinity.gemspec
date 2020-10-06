# frozen_string_literal: false

Gem::Specification.new do |s|
  s.name        = 'filmaffinity'
  s.version     = '1.1.2'
  s.date        = '2017-10-09'
  s.summary     = 'filmaffinity'
  s.description = 'Easily use Ruby or the command line to find information on Filmaffinity.com'
  s.authors     = ['David Santos', 'Oriol Bellido']
  s.email       = 'dsantosmerino@gmail.com'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/davidsantosmerino/filmaffinity-gem'
  s.license       = 'MIT'
  s.add_dependency 'imgur-api', '~> 0'
  s.add_dependency 'json', '>= 1.8', '< 3.0'
  s.add_dependency 'nokogiri', '>= 1.8.1'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.required_ruby_version = '>= 2.5.0'
end
