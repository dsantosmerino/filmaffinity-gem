require_relative "../spec_helper"

describe "JsonMovieParser" do
  describe "#to_hash" do
    subject { JsonMovieParser.new }
    it "return the right director for the given movie" do
      hash = subject.to_hash FilmAffinity::Movie.new(504_889, "El show de Truman (Una vida en directo)")
      expect(hash["director"]).to eq("Peter Weir")
    end
  end
end
