require ".././spec_helper"
describe "FilmAffinity::Search" do
  
  subject(:search) { FilmAffinity::Search.new("truman show") }
  
  describe "valid search" do
    # Get The Truman Show (1998)
    it "#create_document_html" do
      document_html = search.create_document_html
      expect(document_html).to be_an(Nokogiri::HTML::Document)
    end

  end

  describe "valid parse" do
    it "#should parse id" do
      id = "504889"
      expect(id).to eq(search.parse_movie.id)
    end

    it "#should parse title" do
      title = "El show de Truman (Una vida en directo)  (1998)"
      expect(title).to eq(search.parse_movie.title)
    end
    
  end
end
