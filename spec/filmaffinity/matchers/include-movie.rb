require "rspec/expectations"

RSpec::Matchers.define :include_movie do |expected|
  match do |actual|
    actual.any? { |movie| expected.title == movie.title }
  end
end
