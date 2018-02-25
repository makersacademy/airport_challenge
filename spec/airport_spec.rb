require 'airport'
require 'plane'
require 'weather'

describe Airport do
  plane = Plane.new
  airport = Airport.new

# test land
  it "will not allow the plane to land when it's stormy" do
    airport.airport = []
    allow(airport.weather_forcaster).to receive(:stormy?) { true }
    expect(airport.land(plane)).to eq []
    expect(airport.airport).to eq []
  end

  it "will allow the plane to land when it's sunny" do
    airport.airport = []
    allow(airport.weather_forcaster).to receive(:stormy?) { false }
    expect(airport.land(plane)).to eq [plane]
    expect(airport.airport).to eq [plane]
  end
# test takeoff
  it "will allow the plane to take off when it's sunny" do
    landed_plane = plane
    airport.airport = [landed_plane]
    allow(airport.weather_forcaster).to receive(:stormy?) { false }
    expect(airport.takeoff(landed_plane)).to eq []
    expect(airport.airport).to eq []
  end

  it "will allow the plane to take off when it's stormy" do
    landed_plane = plane
    airport.airport = [landed_plane]
    allow(airport.weather_forcaster).to receive(:stormy?) { true }
    expect(airport.takeoff(landed_plane)).to eq [landed_plane]
    expect(airport.airport).to eq [landed_plane]
  end

end
