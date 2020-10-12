require 'rspec/expectations'

RSpec::Matchers.define :include_movie do |expected|
  match do |movies|
    movies.any? do |movie|
      movie.id == expected.id && movie.title == expected.title
    end
  end
end
