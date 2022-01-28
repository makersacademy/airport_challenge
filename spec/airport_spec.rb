require './lib/airport.rb'

describe Airport do 
  it "is the airport at full capacity" do 
    airport = Airport.new
    expect(airport).to respond_to(:full_capacity?)
  end

  it "can land plane" do 
    airport = Airport.new
    expect(airport.land_plane("plane")).to eq(["plane"])
  end
end