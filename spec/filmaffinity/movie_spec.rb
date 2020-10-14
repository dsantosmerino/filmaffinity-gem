require_relative '../spec_helper'

describe FilmAffinity::Movie, :vcr do
  subject(:movie) do
    FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
  end

  context 'english version' do
    describe '#title' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889)
      end

      it 'returns an valid title when initializes with no title' do
        expect(movie.title).to eq('The Truman Show')
      end
    end
    describe '#rating' do

      it 'returns an Float' do
        expect(movie.rating).to be_a(Float)
      end
    end
    describe '#year' do
      it 'returns an Integer' do
        expect(movie.year).to be_an(Integer)
      end
      it 'returns 1998' do
        expect(movie.year).to eq(1998)
      end
    end
    describe '#duration' do
      it 'returns an Integer' do
        expect(movie.duration).to be_a(Integer)
      end
      it 'returns 103' do
        expect(movie.duration).to eq(103)
      end
    end
    describe '#country' do
      it 'returns a String' do
        expect(movie.country).to be_a(String)
      end
      it 'returns "United States"' do
        expect(movie.country).to eq('United States')
      end
    end
    describe '#director' do
      it 'returns a String' do
        expect(movie.director).to be_a(String)
      end
      it 'returns "Peter Weir"' do
        expect(movie.director).to eq('Peter Weir')
      end
    end
    describe '#script' do
      it 'returns a String' do
        expect(movie.script).to be_a(String)
      end
      it 'returns "Andrew Niccol"' do
        expect(movie.script).to eq('Andrew Niccol')
      end
    end
    describe '#cast' do
      it 'returns an Array' do
        expect(movie.cast).to be_an(Array)
      end
      it 'includes the passed cast' do
        expected_cast = [
          'Jim Carrey',
          'Laura Linney',
          'Noah Emmerich',
          'Ed Harris'
        ]
        expect(movie.cast).to include(*expected_cast)
      end
    end
    describe '#company' do
      it 'returns a String' do
        expect(movie.company).to be_a(String)
      end
      it 'returns "Paramount Pictures, Scott Rudin Productions"' do
        expect(movie.company).to eq('Paramount Pictures, Scott Rudin Productions')
      end
    end
    describe '#genres' do
      it 'returns an Array' do
        expect(movie.genres).to be_an(Array)
      end
      it 'includes the passed genres' do
        expected_genres = %w(Drama Comedy Satire)
        expect(movie.genres).to include(*expected_genres)
      end
    end
    describe '#poster' do
      it 'returns a String' do
        expect(movie.poster).to be_a(String)
      end
      it 'returns a .jpg address' do
        expect(movie.poster).to include('.jpg')
      end
    end
  end

  context 'spanish version' do
    before(:all) do
      FilmAffinity.configure do |config|
        config.language = 'ES'
      end
    end

    after(:all) do
      FilmAffinity.configure do |config|
        config.language = 'EN'
      end
    end

    describe '#title' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889)
      end

      it 'returns an valid title when initializes with no title' do
        expect(movie.title).to eq('El show de Truman (Una vida en directo)')
      end
    end
    describe '#rating' do
      it 'returns an Float' do
        expect(movie.rating).to be_a(Float)
      end
    end
    describe '#year' do
      it 'returns an Integer' do
        expect(movie.year).to be_an(Integer)
      end
      it 'returns 1998' do
        expect(movie.year).to eq(1998)
      end
    end
    describe '#duration' do
      it 'returns an Integer' do
        expect(movie.duration).to be_a(Integer)
      end
      it 'returns 103' do
        expect(movie.duration).to eq(103)
      end
    end
    describe '#country' do
      it 'returns a String' do
        expect(movie.country).to be_a(String)
      end
      it 'returns "Estados Unidos"' do
        expect(movie.country).to eq('Estados Unidos')
      end
    end
    describe '#director' do
      it 'returns a String' do
        expect(movie.director).to be_a(String)
      end
      it 'returns "Peter Weir"' do
        expect(movie.director).to eq('Peter Weir')
      end
    end
    describe '#script' do
      it 'returns a String' do
        expect(movie.script).to be_a(String)
      end
      it 'returns "Andrew Niccol"' do
        expect(movie.script).to eq('Andrew Niccol')
      end
    end
    describe '#cast' do
      it 'returns an Array' do
        expect(movie.cast).to be_an(Array)
      end
      it 'includes the passed cast' do
        expected_cast = [
          'Jim Carrey',
          'Laura Linney',
          'Noah Emmerich',
          'Ed Harris'
        ]
        expect(movie.cast).to include(*expected_cast)
      end
    end
    describe '#company' do
      it 'returns a String' do
        expect(movie.company).to be_a(String)
      end
      it 'returns "Paramount Pictures, Scott Rudin Productions"' do
        expect(movie.company).to eq('Paramount Pictures, Scott Rudin Productions')
      end
    end
    describe '#genres' do
      it 'returns an Array' do
        expect(movie.genres).to be_an(Array)
      end
      it 'includes the passed genres' do
        expected_genres = %w[Drama Comedia Sátira]
        expect(movie.genres).to include(*expected_genres)
      end
    end
    describe '#poster' do
      it 'returns a String' do
        expect(movie.poster).to be_a(String)
      end
      it 'returns a .jpg address' do
        expect(movie.poster).to include('.jpg')
      end
    end
  end
end
