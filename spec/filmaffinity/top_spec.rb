require_relative "../spec_helper"
require "pry"

describe "FilmAffinity::Top" do

  describe "#create_document_html" do
    subject(:top) { FilmAffinity::Top.new }

    it "#create_document_html" do
      document_html = top.document_html 0
      expect(document_html).to respond_to(:search)
    end

  end

  describe "#movies" do
      context "no options" do
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
      context "with options" do
        options = {
          :genre => "BE",
          :country => "DE"
        }
        subject(:top) { FilmAffinity::Top.new options:options }
        it "should return an array" do
          movies = top.movies
          expect(movies).to be_an(Array)
        end
        it "should return just FilmAffinity::Movie objects only" do
          movies = top.movies
          movies.each { |movie| expect(movie).to be_an(FilmAffinity::Movie) }
        end
        it "should include 'Hijos del Tercer Reich (TV)'" do
          movies = top.movies
          hijos_del_tercer_reich_movie = FilmAffinity::Movie.new 831118, "Hijos del Tercer Reich (TV)"
          expect(movies).to include_movie(hijos_del_tercer_reich_movie)
        end

      end
      context "with limit 60" do
        limit = 60
        subject(:top) { FilmAffinity::Top.new limit:limit }
        it "should include 'American History X'" do
          movies = top.movies
          american_history_x = FilmAffinity::Movie.new 261972, "American History X"
          expect(movies).to include_movie(american_history_x)
        end
        it "should NOT include 'Con la muerte en los talones'" do
          movies = top.movies
          con_la_muerte_en_los_talones = FilmAffinity::Movie.new 351704, "Con la muerte en los talones"
          expect(movies).not_to include_movie(con_la_muerte_en_los_talones)
        end
        it "should return 60 movies" do
          movies = top.movies
          expect(movies.size).to eq(60)
        end
      end
    end

end
