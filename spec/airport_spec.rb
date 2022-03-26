require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  it "lands a plane at an airport" do
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    expect(airport.land(plane)).to eq "Plane landed at airport"
  end

  it "instructs plane to take off from airport" do
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    airport.land(plane)
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
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    airport.land(plane)
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :stormy
    expect { airport.take_off(plane) }.to raise_error "Cannot proceed due to storm"
  end
  it "prevents plane from landing if weather is stormy" do 
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :stormy
    expect { airport.land(plane) }.to raise_error("Cannot proceed due to storm")
  end
  it "prevents plane from landing if airport is full" do
    new_plane = Plane.new
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(new_plane) }.to raise_error "Airport is full"
  end
  it "checks if plane is in airport" do
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    airport.land(plane)
    expect(airport.in_airport?(plane)).to eq true
  end
  it "ensures that planes can only take off from airport they are in" do
    plane = Plane.new
    heathrow = Airport.new
    sydney = Airport.new
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    heathrow.land(plane)
    expect { sydney.take_off(plane) }.to raise_error "This plane is not in this airport"
  end
end
