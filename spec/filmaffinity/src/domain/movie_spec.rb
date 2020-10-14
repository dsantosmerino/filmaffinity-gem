require 'spec_helper'

describe FilmAffinity::Src::Domain::Movie do
  subject { described_class }

  describe '.new' do
    let(:result) { described_class.new(attributes) }

    context 'no including required attributes' do
      let(:attributes) { {} }

      it 'raises the expected error' do
        expect { result }.to raise_error(Dry::Struct::Error)
      end
    end
    context 'with the minimum attributes' do
      let(:attributes) { { id: 32, title: 'Something here' } }
      let(:expected_attributes) do
        [
          :id, :title, :year, :duration, :country, :director, :music, :company,
          :script, :photography, :cast, :genres, :sinopsis, :rating,
          :poster, :poster_big
        ]
      end

      it 'returns the expected object, responding to the expected methods' do
        expect(result).to be_a(described_class)
        expect(result).to respond_to(*expected_attributes)
      end
    end
  end

  describe '#to_json' do
    subject { described_class.new(attributes) }

    let(:result) { subject.to_json }
    let(:attributes) do
      { id: 32, title: 'Something here' }
    end
    let(:default_attributes) do
      { cast: [], genres: [] }
    end

    it 'returns a JSON with the expected content' do
      expect(result).to eq(JSON.generate(attributes.merge(default_attributes)))
    end
  end
end
