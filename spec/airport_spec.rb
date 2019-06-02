require "airport"
require "plane"

RSpec.describe Airport do
  let(:plane) { Plane.new }

  it "is created with no planes" do
    airport = Airport.new

    expect(airport.landed_planes).to be_empty
  end

  it "receives a plane" do
    airport = Airport.new

    airport.land(plane)

    expect(airport.landed_planes).to eq([plane])
  end

  it "allows a plane to leave" do
    airport = Airport.new(landed_planes: [plane])

    airport.take_off(plane)

    expect(airport.landed_planes).to eq([])
  end

  context "when weather is stormy" do
    it "denies take off" do
      airport = Airport.new(weather: :stormy, landed_planes: [plane])

      expect { airport.take_off(plane) }.to raise_error("denied due to weather")
    end

    it "refuses landing" do
      airport = Airport.new(weather: :stormy)
  
      expect { airport.land(plane) }.to raise_error("denied due to weather")
    end
  end

  context "when capacity is full" do
    let(:plane_inventory) { [plane] }

    it "refuses landing" do
      airport = Airport.new(landed_planes: plane_inventory, capacity: plane_inventory.count)

      expect { airport.land(plane) }.to raise_error("denied: airport is full")
    end
  end

  context "when created without a specified capacity" do
    let(:default_capacity) { 4 }

    it "uses default capacity" do
      airport = Airport.new(landed_planes: 0)

      expect(airport.capacity).to eq(default_capacity)
    end
  end
end
