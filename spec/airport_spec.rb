require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  it "lands a plane at an airport" do
    allow_any_instance_of(Weather).to receive(:predictions).and_return 0
    expect(airport.land(plane)).to eq "Plane landed at airport"
  end

  it "instructs plane to take off from airport" do
    allow_any_instance_of(Weather).to receive(:predictions).and_return 0
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
    allow_any_instance_of(Weather).to receive(:stormy?).and_return 9
    expect{ airport.take_off(plane) }.to raise_error("It is too stormy to fly")
  end
  it "prevents plane from landing if weather is stormy" do 
    allow_any_instance_of(Weather).to receive(:stormy?).and_return 9
    expect { airport.land(plane) }.to raise_error("It is too stormy to land")
  end
  it "prevents plane from landing if airport is full" do
    allow_any_instance_of(Weather).to receive(:predictions).and_return 0
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error("Airport is full")
  end
end