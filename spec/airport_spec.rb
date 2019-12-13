require 'airport'

describe Airport do

  it "can create an instance of the class Airport" do
    airport = Airport.new
    expect(airport).to be_a Airport
  end

  it "has a method to instruct a plane to land at the airport" do
    expect(Airport.new).to respond_to(:land)
  end

  it "includes a plane that has landed in a list of landed planes" do
    airport = Airport.new
    airport.land("Cathay Pacific")
    expect(airport.landed_planes).to include ("Cathay Pacific")
  end

  it "has a method to instruct a plane to take off" do
    expect(Airport.new).to respond_to(:take_off)
  end

end
