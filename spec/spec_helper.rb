require 'rspec'
require 'vcr'
require 'filmaffinity'
require_relative 'matchers/include_movie'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
