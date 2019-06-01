require "airport"
require "plane"

RSpec.describe Airport do
  it "is created with no planes" do
    airport = Airport.new(:stormy)

    expect(airport.landed_planes).to be_empty
  end

  it "receives a plane" do
    # arrange
    airport = Airport.new(:stormy)
    plane = Plane.new
    # act
    airport.land(plane)
    # assert
    expect(airport.landed_planes).to eq([plane])
  end

  it "allows a plane to leave" do
    # arrange
    plane = Plane.new
    airport = Airport.new(:not_stormy, [plane])
    # act
    airport.take_off(plane)
    # assert
    expect(airport.landed_planes).to eq([])
  end

  it "denies take off in stormy weather" do
    # arrange
    plane = Plane.new
    weather = :stormy
    airport = Airport.new(weather, [plane])
    # act & assert
    expect { airport.take_off(plane) }.to raise_error("denied due to weather")
  end

end
