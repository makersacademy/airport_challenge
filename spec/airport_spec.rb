require 'airport'
require 'plane'
require 'weather'

describe Airport do
  plane = Plane.new
  airport = Airport.new

# test land
  it "will not allow the plane to land when the airport reaches default capacity" do
    DEFAULT_CAPACITY = 10
    airport.planes = (1..DEFAULT_CAPACITY).map { |_i| Plane.new }
    allow(airport).to receive(:full?) { true }

    expect(airport.planes).to all(be_instance_of Plane)
    expect{ airport.land(plane) }.to raise_error("Sorry, the airport is full")
    expect(airport.planes.length).to be DEFAULT_CAPACITY
  end

  it "it will not allow the plane to land when the airport reaches capacity" do
    @capacity = 25
    airport = Airport.new(25)
    airport.planes = (1..25).map { |_i| Plane.new }
    allow(airport).to receive(:full?) { true }

    expect(airport.planes).to all(be_instance_of Plane)
    expect{ airport.land(plane) }.to raise_error("Sorry, the airport is full")
    expect(airport.planes.length).to be 25
  end

  it "will not allow the plane to land when it's stormy" do
    airport.planes = []
    allow(airport).to receive(:full?) { false }
    allow(airport.weather_forcaster).to receive(:stormy?) { true }

    expect{ airport.land(plane) }.to raise_error("Sorry, it's too stormy to land")
    expect(airport.planes).to eq []
  end

  it "will allow the plane to land when it's sunny" do
    airport.planes = []
    allow(airport).to receive(:full?) { false }
    allow(airport.weather_forcaster).to receive(:stormy?) { false }

    expect(airport.land(plane)).to eq [plane]
    expect(airport.planes).to eq [plane]
  end
# test takeoff
  it "will allow the plane to take off when it's sunny" do
    landed_plane = plane
    airport.planes = [landed_plane]
    allow(airport.weather_forcaster).to receive(:stormy?) { false }

    expect(airport.takeoff(landed_plane)).to eq []
    expect(airport.planes).to eq []
  end

  it "will not allow the plane to take off when it's stormy" do
    landed_plane = plane
    airport.planes = [landed_plane]
    allow(airport.weather_forcaster).to receive(:stormy?) { true }

    expect{ airport.takeoff(plane) }.to raise_error("Sorry, it's too stormy to take off")
    expect(airport.planes).to eq [landed_plane]
  end

end
