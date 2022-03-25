require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  it "lands a plane at an airport" do
    expect(airport.land(plane)).to eq "Plane landed at airport"
  end
  it "instructs plane to take off from airport" do
    expect(airport.take_off(plane)).to eq "Plane has taken off from airport"
  end
  it "has a default capacity of 20 planes" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end
  it "can override the default capacity when requested" do
    airport50 = Airport.new(50)
    expect(airport50.capacity).to eq 50
  end
  it "prevents take off when weather is stormy" do
    allow(weather).to receive(:stormy).and_return true
    expect { airport.take_off(plane)}.to raise_error("It is too stormy to fly")
  end
end