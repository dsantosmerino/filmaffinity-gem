# frozen_string_literal: true

require 'spec_helper'

describe JsonMoviesParser, :vcr do
  describe '#to_hashes' do
    subject { JsonMoviesParser.new }

    it 'returns some valid ids for a given search' do
      hashes = subject.to_hashes FilmAffinity::Search.new('truman').movies
      expect(hashes.map { |hash| hash['id'] }).to include(193_232, 504_889)
    end
  end
end
