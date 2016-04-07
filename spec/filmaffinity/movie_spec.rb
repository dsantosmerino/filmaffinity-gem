require_relative "../spec_helper"

describe "FilmAffinity::Movie" do
  describe "valid movie" do
    # Get The Truman Show (1998)
    subject(:movie) { FilmAffinity::Movie.new("504889", "El show de Truman (Una vida en directo)") }

    it "#cast" do
      cast = movie.cast
      expected_cast = [
        "Jim Carrey",
        "Laura Linney",
        "Noah Emmerich",
        "Ed Harris"
      ]

      expect(cast).to be_an(Array)
      expect(cast).to include(*expected_cast)
    end

    it "#duration" do
      duration = 103
      expect(duration).to eq(movie.duration)
    end

  end
end
