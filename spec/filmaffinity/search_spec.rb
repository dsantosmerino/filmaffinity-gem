require ".././spec_helper"

describe "FilmAffinity::Search" do
  describe "valid search" do
    # Get The Truman Show (1998)
    subject(:search) { FilmAffinity::Search.new("truman show") }

    it "#create_document_html" do
      document_html = search.create_document_html

      expect(document_html).to be_an(Nokogiri::HTML::Document)
    end

  end
end
