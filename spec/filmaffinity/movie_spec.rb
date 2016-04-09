require_relative "../spec_helper"

describe "FilmAffinity::Movie" do

  describe "#title" do
    subject(:movie) { FilmAffinity::Movie.new(504889) }
    it "should return an valid title when initializes with no title" do
      expect(movie.title).to eq("El show de Truman (Una vida en directo)")
    end
  end

  describe "#rating" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return an Float" do
      expect(movie.rating).to be_a(Float)
    end
  end

  describe "#year" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return an Fixnum" do
      expect(movie.year).to be_an(Fixnum)
    end
    it "should return 1998" do
      expect(movie.year).to eq(1998)
    end
  end

  describe "#duration" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return an Fixnum" do
      expect(movie.duration).to be_a(Fixnum)
    end
    it "should return 103" do
      expect(movie.duration).to eq(103)
    end
  end

  describe "#country" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return a String" do
      expect(movie.country).to be_a(String)
    end
    it "should return 'Estados Unidos'" do
      expect(movie.country).to eq("Estados Unidos")
    end
  end

  describe "#director" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return a String" do
      expect(movie.director).to be_a(String)
    end
    it "should return 'Peter Weir'" do
      expect(movie.director).to eq("Peter Weir")
    end
  end

  describe "#script" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return a String" do
      expect(movie.script).to be_a(String)
    end
    it "should return 'Andrew Niccol'" do
      expect(movie.script).to eq("Andrew Niccol")
    end
  end

  describe "#cast" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return an Array" do
      expect(movie.cast).to be_an(Array)
    end
    it "should to include the passed cast" do
      expected_cast = [
        "Jim Carrey",
        "Laura Linney",
        "Noah Emmerich",
        "Ed Harris"
      ]
      expect(movie.cast).to include(*expected_cast)
    end
  end

  describe "#company" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return a String" do
      expect(movie.company).to be_a(String)
    end
    it "should return 'Paramount Pictures / Scott Rudin Productions'" do
      expect(movie.company).to eq("Paramount Pictures / Scott Rudin Productions")
    end
  end

  describe "#genres" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return an Array" do
      expect(movie.genres).to be_an(Array)
    end
    it "should to include the passed genres" do
      expected_genres = [
        "Drama",
        "Comedia",
        "Sátira"
      ]
      expect(movie.genres).to include(*expected_genres)
    end
  end


  describe "#poster" do
    subject(:movie) { FilmAffinity::Movie.new(504889, "El show de Truman (Una vida en directo)") }
    it "should return a String" do
      expect(movie.poster).to be_a(String)
    end
    it "should return the correct img url" do
      expect(movie.poster).to eq("http://pics.filmaffinity.com/El_show_de_Truman_Una_vida_en_directo-130091557-main.jpg")
    end
  end

end
