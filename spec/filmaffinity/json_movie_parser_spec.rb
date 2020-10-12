require_relative '../spec_helper'

describe JsonMovieParser do
  describe '#to_hash' do
    subject { JsonMovieParser.new }

    it 'returns the right director for the given movie' do
      movie = FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      hash = subject.to_hash movie
      expect(hash['director']).to eq('Peter Weir')
    end
  end
end
