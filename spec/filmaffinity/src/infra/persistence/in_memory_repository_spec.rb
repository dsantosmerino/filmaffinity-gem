require 'spec_helper'

describe FilmAffinity::Src::Infra::Persistence::InMemoryRepository do
  subject { described_class.new }

  describe '.new' do
    context 'with no data source provided' do
      subject { described_class.new }

      it 'returns an empty repo' do
        expect(subject.all).to be_empty
      end
    end

    context 'providing a data source' do
      subject { described_class.new(data_source) }

      let(:data_source) do
        [
          FilmAffinity::Src::Domain::Movie.new(id: 1, title: 'Whatever.')
        ]
      end

      it 'returns a repo with the initial data source' do
        expect(subject.all).to eq(data_source)
      end
    end
  end

  describe '#all' do
    let(:result) { subject.all }

    context 'with no items in the repo' do
      it 'returns an empty collection' do
        expect(result).to be_empty
      end
    end

    context 'after creating an item' do
      before do
        create_movie
      end

      let(:create_movie) { subject.create(movie) }
      let(:movie) do
        FilmAffinity::Src::Domain::Movie.new(id: 1, title: 'Whatever.')
      end

      it 'returns a collection with one item' do
        expect(result.size).to eq(1)
      end

      it 'returns the expected item' do
        expect(result).to include(movie)
      end
    end
  end

  describe '#where' do
    let(:result) { subject.where(**query) }

    context 'by id' do
      let(:query) { { id: id_to_find } }

      before do
        create_movie
      end

      let(:create_movie) { subject.create(movie) }
      let(:movie) do
        FilmAffinity::Src::Domain::Movie.new(id: 1, title: 'Whatever.')
      end

      context 'with no items matching the query' do
        let(:id_to_find) { movie.id + 1 }

        it 'returns an empty collection' do
          expect(result).to be_empty
        end
      end
      context 'with some items matching the query' do
        let(:id_to_find) { movie.id }

        it 'returns a collection with one item' do
          expect(result.size).to eq(1)
        end
  
        it 'returns the expected item' do
          expect(result).to include(movie)
        end
      end
    end

    context 'by title' do
      let(:query) { { title: title_to_find } }

      before do
        create_movie
      end

      let(:create_movie) { subject.create(movie) }
      let(:movie) do
        FilmAffinity::Src::Domain::Movie.new(id: 1, title: 'Whatever.')
      end

      context 'with no items matching the query' do
        let(:title_to_find) { 'Something else.' }

        it 'returns an empty collection' do
          expect(result).to be_empty
        end
      end
      context 'with some items matching the query' do
        let(:title_to_find) { 'Whatever.' }

        it 'returns a collection with one item' do
          expect(result.size).to eq(1)
        end
  
        it 'returns the expected item' do
          expect(result).to include(movie)
        end
      end
    end

    context 'by cast' do
      let(:query) { { cast: actor_to_find } }

      before do
        create_movie
      end

      let(:create_movie) { subject.create(movie) }
      let(:movie) do
        FilmAffinity::Src::Domain::Movie.new(id: 1, title: 'Whatever.', cast: cast)
      end

      context 'with no items matching the query' do
        let(:actor_to_find) { 'Leonardo DiCaprio' }
        let(:cast) { [] }

        it 'returns an empty collection' do
          expect(result).to be_empty
        end
      end
      context 'with some items matching the query' do
        let(:actor_to_find) { 'Leonardo DiCaprio' }
        let(:cast) { [actor_to_find] }

        it 'returns a collection with one item' do
          expect(result.size).to eq(1)
        end
  
        it 'returns the expected item' do
          expect(result).to include(movie)
        end
      end
    end
  end
end
