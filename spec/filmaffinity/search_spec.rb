require_relative "../spec_helper"
require_relative "matchers/include-movie"


describe "FilmAffinity::Search" do

  describe "#create_document_html" do
    subject(:search) { FilmAffinity::Search.new("truman") }

    it "#create_document_html" do
      document_html = search.create_document_html
      expect(document_html).to be_an(Nokogiri::HTML::Document)
    end

  end

  describe "#movies" do
    subject(:search) { FilmAffinity::Search.new("truman") }

    it "should return an array" do
      movies = search.movies
      expect(movies).to be_an(Array)
    end
    it "should return just FilmAffinity::Movie objects only" do
      movies = search.movies
      movies.each { |movie| expect(movie).to be_an(FilmAffinity::Movie) }
    end
    it "should include 'Truman Show'" do
      movies = search.movies
      truman_movie = FilmAffinity::Movie.new 504889, "El show de Truman (Una vida en directo)"
      expect(movies).to include_movie(truman_movie)
    end
  end

  describe "#parse_movie" do
    #Get a direct result from a specific searchs
    subject(:search) { FilmAffinity::Search.new("truman show") }

    it "should parse id" do
      id = 504889
      expect(id).to eq(search.parse_movie.id)
    end

    it "should parse title" do
      title = "El show de Truman (Una vida en directo)  (1998)"
      expect(title).to eq(search.parse_movie.title)
    end

  end
end
