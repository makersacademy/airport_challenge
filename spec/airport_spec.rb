require 'airport'
require 'plane'
describe Airport do
  it "should be used after a plane landed" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq [plane]
  end

  it "should be empty after a plane taking off" do
    plane = Plane.new
    airport = Airport.new
    landed_plane = plane
    airport.airport = [landed_plane]
    allow(airport).to receive(:weather) { :sunny }
    expect(airport.takeoff(landed_plane)).to eq []
    expect(airport.airport).to eq []
  end

  it "should not be empty when it's stormy" do
    plane = Plane.new
    airport = Airport.new
    landed_plane = plane
    airport.airport = [landed_plane]
    allow(airport).to receive(:weather) { :stormy }
    expect(airport.takeoff(landed_plane)).to eq [landed_plane]
    expect(airport.airport).to eq [landed_plane]
  end
end
