require_relative '../spec_helper'

describe FilmAffinity::Top do
  describe '#movies' do
    context 'no options' do
      subject(:top) { FilmAffinity::Top.new }

      it 'returns an array' do
        expect(top.movies).to be_an(Array)
      end
      it 'returns just FilmAffinity::Movie objects only' do
        top.movies.each { |movie| expect(movie).to be_an(FilmAffinity::Movie) }
      end
      it 'includes "El Padrino"' do
        el_padrino_movie = FilmAffinity::Movie.new(809_297, 'El padrino')
        expect(top.movies).to include_movie(el_padrino_movie)
      end
      it 'returns 30 movies' do
        expect(top.movies.size).to eq(30)
      end
    end
    context 'with options' do
      subject(:top) do
        FilmAffinity::Top.new(options: { genre: 'BE', country: 'DE' })
      end

      context 'with genre "BE" and country code "DE"' do
        it 'returns an array' do
          expect(top.movies).to be_an(Array)
        end
        it 'returns just FilmAffinity::Movie objects only' do
          top.movies.each do |movie|
            expect(movie).to be_an(FilmAffinity::Movie)
          end
        end
        it 'includes "Hijos del Tercer Reich (Miniserie de TV)"' do
          hijos = FilmAffinity::Movie.new(
            831_118, 'Hijos del Tercer Reich (Miniserie de TV)'
          )
          expect(top.movies).to include_movie(hijos)
        end
      end
      context 'only with limit' do
        subject(:top) { FilmAffinity::Top.new limit: limit }
        
        context 'set to 10' do
          let(:limit) { 10 }
  
          it 'returns 10 movies' do
            expect(top.movies.size).to eq(10)
          end
        end
        context 'set to 60' do
          let(:limit) { 60 }
  
          it 'includes "American History X"' do
            american_history_x = FilmAffinity::Movie.new(
              261_972, 'American History X'
            )
            expect(top.movies).to include_movie(american_history_x)
          end
          it 'does not include "Con la muerte en los talones"' do
            con_movie = FilmAffinity::Movie.new(
              351_704, 'Con la muerte en los talones'
            )
            expect(top.movies).not_to include_movie(con_movie)
          end
          it 'returns 60 movies' do
            expect(top.movies.size).to eq(60)
          end
        end
        context 'set to 132' do
          let(:limit) { 132 }
  
          it 'returns 132 movies' do
            expect(top.movies.size).to eq(132)
          end
        end
      end
    end
  end
end
