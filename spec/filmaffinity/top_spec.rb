require 'spec_helper'

describe FilmAffinity::Top, :vcr do
  describe '#movies' do
    context 'no options' do
      subject(:top) { FilmAffinity::Top.new }

      it 'returns an array' do
        expect(top.movies).to be_an(Array)
      end
      it 'returns FilmAffinity::Movie objects only' do
        expect(top.movies).to all(be_an(FilmAffinity::Movie))
      end
      it 'includes "The Godfather"' do
        the_godfather = FilmAffinity::Movie.new(809_297, 'The Godfather')
        expect(top.movies).to include_movie(the_godfather)
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
        it 'returns FilmAffinity::Movie objects only' do
          expect(top.movies).to all(be_an(FilmAffinity::Movie))
        end
        it 'includes "Generation War (TV Miniseries)"' do
          generation_war = FilmAffinity::Movie.new(
            831_118, 'Generation War (TV Miniseries)'
          )
          expect(top.movies).to include_movie(generation_war)
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
