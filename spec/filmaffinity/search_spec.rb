# frozen_string_literal: true

require 'spec_helper'

describe FilmAffinity::Search, :vcr do
  describe '#movies' do
    subject(:search) { FilmAffinity::Search.new('truman') }

    it 'returns an array' do
      movies = search.movies
      expect(movies).to be_an(Array)
    end
    it 'returns FilmAffinity::Movie objects only' do
      expect(search.movies).to all(be_an(FilmAffinity::Movie))
    end
    it 'includes the "The Truman Show"' do
      movies = search.movies
      truman_movie = FilmAffinity::Movie.new(
        504_889, 'The Truman Show'
      )
      expect(movies).to include_movie(truman_movie)
    end
  end

  describe '#parse_movie' do
    # Get a direct result from a specific searchs
    subject(:search) { FilmAffinity::Search.new('truman show') }

    it 'parses the id' do
      id = 504_889
      expect(id).to eq(search.movies.first.id)
    end

    it 'parses the title' do
      title = 'The Truman Show  (1998)'
      expect(title).to eq(search.movies.first.title)
    end
  end
end
