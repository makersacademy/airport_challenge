require "airport"
require "plane"

RSpec.describe Airport do
  it "is created with no planes" do
    airport = Airport.new

    expect(airport.landed_planes).to be_empty
  end

  it "receives a plane" do
    plane = Plane.new
    airport = Airport.new

    airport.land(plane)

    expect(airport.landed_planes).to eq([plane])
  end

  it "allows a plane to leave" do
    plane = Plane.new
    airport = Airport.new(landed_planes: [plane])

    airport.take_off(plane)

    expect(airport.landed_planes).to eq([])
  end
    
  it "denies take off in stormy weather" do
    plane = Plane.new

    airport = Airport.new(weather: :stormy, landed_planes: [plane])

    expect { airport.take_off(plane) }.to raise_error("denied due to weather")
  end

  it "refuses landing in stormy weather" do
    plane = Plane.new
    airport = Airport.new(weather: :stormy)

    expect { airport.land(plane) }.to raise_error("denied due to weather")
  end

  it "refuses landing when full" do
    plane = Plane.new
    airport = Airport.new(capacity: 1, landed_planes: [plane])

    expect { airport.land(plane) }.to raise_error("denied: airport is full")
  end

  it "has a default capacity when none given" do
    airport = Airport.new(weather: :sunny, landed_planes: 0)

    expect(airport.capacity).to eq(4)
  end
end
