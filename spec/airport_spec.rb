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
    airport.land(plane)
    allow_any_instance_of(Weather).to receive(:stormy?).and_return 9
    expect{ airport.take_off(plane) }.to raise_error "Cannot proceed due to storm"
  end
  it "prevents plane from landing if weather is stormy" do 
    allow_any_instance_of(Weather).to receive(:stormy?).and_return 9
    expect { airport.land(plane) }.to raise_error("Cannot proceed due to storm")
  end
  it "prevents plane from landing if airport is full" do
    new_plane = Plane.new
    allow_any_instance_of(Weather).to receive(:predictions).and_return 0
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(new_plane) }.to raise_error "Airport is full"
  end
end
  describe "Edge Case" do
    let(:weather) { Weather.new }
    let(:plane) { Plane.new }
    let(:airport) { Airport.new }

  it "ensures that planes can only take off from airport they are in" do
    plane = Plane.new
    heathrow = Airport.new
    sydney = Airport.new
    allow_any_instance_of(Weather).to receive(:predictions).and_return 0
    heathrow.land(plane)
    expect { sydney.take_off(plane) }.to raise_error "This plane is not in this airport"
  end
  it "ensures that planes that are already flying cannot take off from an airport" do
    allow_any_instance_of(Weather).to receive(:predictions).and_return 0
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane)}.to raise_error "This plane is currently flying"
  end
  it "ensures that planes that are flying are not currently in an airport" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include(plane)
  end
  it "ensures that landed planes cannot land again" do
    airport.land(plane)
    expect { airport.land(plane)}.to raise_error "This plane is already in this airport"
  end
end

# ensuring that planes can only take off from airports they are in;
# planes that are already flying cannot take off and/or be in an airport
# planes that are landed cannot land again and must be in an airport