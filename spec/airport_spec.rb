require "airport"
require "weather"

describe Airport do

  # it "responds to land" do
  #   expect(subject).to respond_to :land_plane
  # end

  it "lands a plane" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: false))
    expect(airport.land_plane(plane)).to eq plane
  end

  #'lands a plane' test returns an error even though the plane returned is same that lands.

  it "allows a plane to takeoff and removes it from the airport" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: false))
    airport.land_plane(plane)
    expect(airport.takeoff).to eq plane
  end

  it "stops plane taking off when it's stormy" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: false))
    airport.land_plane(plane)
    airport = Airport.new(double(:weather, stormy?: true))
    expect {airport.takeoff}.to raise_error "Weather is too stormy to takeoff"
  end

  it "stops plan landing when it's stormy" do
    plane = Plane.new
    airport = Airport.new(double(:weather, stormy?: true))
    expect {airport.land_plane(plane)}.to raise_error "Weather is too stormy to land"
  end

  it 'has a default capacity' do
    airport = Airport.new(double(:weather, stormy?: false))
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

    it 'has a capacity that can be set' do
      airport = Airport.new(double(:weather, stormy?: false),30)
      expect(airport.capacity).to eq 30
    end
  #below test assumes that the capacity of the airport is 20
  # it "stops more planes landing when the airport is full"
  #   plane = Plane.new
  #   airport = Airport.new(double(:weather, stormy?: false))
  #   airport
end
