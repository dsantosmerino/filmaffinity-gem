require_relative "../spec_helper"

describe "FilmAffinity::Top" do

  describe "#create_document_html" do
    subject(:top) { FilmAffinity::Search.new("truman") }

    it "#create_document_html" do
      document_html = top.document_html
      expect(document_html).to be_an(Nokogiri::HTML::Document)
    end

  end

  describe "#movies" do
    subject(:top) { FilmAffinity::Top.new }

    it "should return an array" do
      movies = top.movies
      expect(movies).to be_an(Array)
    end
    it "should return just FilmAffinity::Movie objects only" do
      movies = top.movies
      movies.each { |movie| expect(movie).to be_an(FilmAffinity::Movie) }
    end
    it "should include 'El Padrino'" do
      movies = top.movies
      el_padrino_movie = FilmAffinity::Movie.new 809297, "El padrino"
      expect(movies).to include_movie(el_padrino_movie)
    end
  end

end
