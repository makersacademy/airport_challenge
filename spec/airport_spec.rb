require "airport"
require "plane"

RSpec.describe Airport do
  it "is created with no planes" do
    airport = Airport.new

    expect(airport.landed_planes).to be_empty
  end

  it "receives a plane" do
    # arrange
    airport = Airport.new
    plane = Plane.new
    # act
    airport.land(plane)
    # assert
    expect(airport.landed_planes).to eq([plane])
  end

  it "allows a plane to leave" do
    # arrange
    airport = Airport.new
    plane = Plane.new
    @landed_planes = [plane]
    # act
    airport.take_off(plane)
    # assert
    expect(airport.landed_planes).to eq([])
  end
end
