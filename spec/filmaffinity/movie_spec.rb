require_relative '../spec_helper'

describe 'FilmAffinity::Movie' do
  context 'english version' do
    describe '#title' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889)
      end
      it 'should return an valid title when initializes with no title' do
        expect(movie.title).to eq('The Truman Show')
      end
    end

    describe '#rating' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Float' do
        expect(movie.rating).to be_a(Float)
      end
    end

    describe '#year' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Fixnum' do
        expect(movie.year).to be_an(Fixnum)
      end
      it 'should return 1998' do
        expect(movie.year).to eq(1998)
      end
    end

    describe '#duration' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Fixnum' do
        expect(movie.duration).to be_a(Fixnum)
      end
      it 'should return 103' do
        expect(movie.duration).to eq(103)
      end
    end

    describe '#country' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.country).to be_a(String)
      end
      it 'should return "United States"' do
        expect(movie.country).to eq('United States')
      end
    end

    describe '#director' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.director).to be_a(String)
      end
      it 'should return "Peter Weir"' do
        expect(movie.director).to eq('Peter Weir')
      end
    end

    describe '#script' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.script).to be_a(String)
      end
      it 'should return "Andrew Niccol"' do
        expect(movie.script).to eq('Andrew Niccol')
      end
    end

    describe '#cast' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Array' do
        expect(movie.cast).to be_an(Array)
      end
      it 'should to include the passed cast' do
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
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.company).to be_a(String)
      end
      it 'should return "Paramount Pictures, Scott Rudin Productions"' do
        expect(movie.company).to eq('Paramount Pictures, Scott Rudin Productions')
      end
    end

    describe '#genres' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Array' do
        expect(movie.genres).to be_an(Array)
      end
      it 'should to include the passed genres' do
        expected_genres = %w(Drama Comedy Satire)
        expect(movie.genres).to include(*expected_genres)
      end
    end

    describe '#poster' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.poster).to be_a(String)
      end
      it 'should return a .jpg address' do
        expect(movie.poster).to include('.jpg')
      end
    end
  end

  context 'spanish version' do
    before :all do
      FilmAffinity.configure do |config|
        config.language = 'ES'
      end
    end

    describe '#title' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889)
      end
      it 'should return an valid title when initializes with no title' do
        expect(movie.title).to eq('El show de Truman (Una vida en directo)')
      end
    end

    describe '#rating' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Float' do
        expect(movie.rating).to be_a(Float)
      end
    end

    describe '#year' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Fixnum' do
        expect(movie.year).to be_an(Fixnum)
      end
      it 'should return 1998' do
        expect(movie.year).to eq(1998)
      end
    end

    describe '#duration' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Fixnum' do
        expect(movie.duration).to be_a(Fixnum)
      end
      it 'should return 103' do
        expect(movie.duration).to eq(103)
      end
    end

    describe '#country' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.country).to be_a(String)
      end
      it 'should return "Estados Unidos"' do
        expect(movie.country).to eq('Estados Unidos')
      end
    end

    describe '#director' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.director).to be_a(String)
      end
      it 'should return "Peter Weir"' do
        expect(movie.director).to eq('Peter Weir')
      end
    end

    describe '#script' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.script).to be_a(String)
      end
      it 'should return "Andrew Niccol"' do
        expect(movie.script).to eq('Andrew Niccol')
      end
    end

    describe '#cast' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Array' do
        expect(movie.cast).to be_an(Array)
      end
      it 'should to include the passed cast' do
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
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.company).to be_a(String)
      end
      it 'should return "Paramount Pictures, Scott Rudin Productions"' do
        expect(movie.company).to eq('Paramount Pictures, Scott Rudin Productions')
      end
    end

    describe '#genres' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return an Array' do
        expect(movie.genres).to be_an(Array)
      end
      it 'should to include the passed genres' do
        expected_genres = %w(Drama Comedia Sátira)
        expect(movie.genres).to include(*expected_genres)
      end
    end

    describe '#poster' do
      subject(:movie) do
        FilmAffinity::Movie.new(504_889, 'El show de Truman (Una vida en directo)')
      end
      it 'should return a String' do
        expect(movie.poster).to be_a(String)
      end
      it 'should return a .jpg address' do
        expect(movie.poster).to include('.jpg')
      end
    end
  end
end
