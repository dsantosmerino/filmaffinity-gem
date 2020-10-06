require 'rspec/expectations'

RSpec::Matchers.define :include_movie do |expected|
  match do |movies|
    movies.any? { |movie| movie.title == expected.title }
  end
end
