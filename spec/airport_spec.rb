require "airport.rb"

describe Airport do

let (:airport) {Airport.new}

  it "responds to land method" do
    expect(airport).to respond_to :land

  end
end
