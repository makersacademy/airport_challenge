require "airport"
require "plane"

RSpec.describe Airport do
  it "is created with no planes" do
    capacity = 3
    airport = Airport.new(:stormy, capacity)

    expect(airport.landed_planes).to be_empty
  end

  it "receives a plane" do
    # arrange
    plane = Plane.new
    capacity = 3
    airport = Airport.new(:not_stormy, capacity)

    # act
    airport.land(plane)
    # assert
    expect(airport.landed_planes).to eq([plane])
  end

  it "allows a plane to leave" do
    # arrange
    plane = Plane.new
    capacity = 3
    airport = Airport.new(:not_stormy, capacity, [plane])
    # act
    airport.take_off(plane)
    # assert
    expect(airport.landed_planes).to eq([])
  end

  it "denies take off in stormy weather" do
    # arrange
    plane = Plane.new
    weather = :stormy
    capacity = 3
    airport = Airport.new(weather, capacity, [plane])
    # act & assert
    expect { airport.take_off(plane) }.to raise_error("denied due to weather")
  end

  it "refuses landing in stormy weather" do
    # arrange
    plane = Plane.new
    weather = :stormy
    capacity = 3
    airport = Airport.new(weather, capacity)
    # act & assert
    expect { airport.land(plane) }.to raise_error("denied due to weather")
  end

  it "refuses landing when full" do
    # arrange
    plane = Plane.new
    weather = :not_stormy
    capacity = 3
    airport = Airport.new(weather, capacity, [plane, plane, plane])
    # act & assert
    expect { airport.land(plane) }.to raise_error("denied: airport is full")
  end
end
