require ".././spec_helper"

describe "FilmAffinity::Movie" do
  describe "valid movie" do
    # Get The Truman Show (1998)
    subject(:movie) { FilmAffinity::Movie.new("504889") }

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

  end
end
