Gem::Specification.new do |s|
  s.name        = 'filmaffinity'
  s.version     = '0.0.2'
  s.date        = '2016-04-05'
  s.summary     = "filmaffinity"
  s.description = "Easily use Ruby or the command line to find information on Filmaffinity.com"
  s.authors     = ["David Santos, Oriol Bellido"]
  s.email       = 'dsantosmerino92@gmail.com'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.homepage      = 'http://rubygems.org/gems/filmaffinity'
  s.license       = 'MIT'
  s.add_dependency 'nokogiri', ' ~> 1.6.7.2'
  s.add_development_dependency 'rake', '~> 10.4.2'
  s.add_development_dependency 'rspec', '~> 3.4.0'
end
