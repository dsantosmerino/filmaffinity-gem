# frozen_string_literal: true

require "spec_helper"

RSpec.describe FilmAffinity::VERSION do
  subject { FilmAffinity::VERSION }

  it "returns a valid gem version string" do
    expect(subject).to match(/^\d+\.\d+\.\d+(\.\w+)?$/)
  end

  it "returns the expected version" do
    expect(subject).to eq("1.1.4")
  end
end
