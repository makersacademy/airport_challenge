require 'airport_challenge'

describe Airport do
  it 'lands a plane' do
    plane = Plane.new
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    expect(subject.hanger).to include(plane)
  end

  it 'allows a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    airport.hanger << plane
    allow(airport).to receive(:weather) { "sunny" }
    expect(airport.take_off(plane)).to eq plane
    expect(airport.check_hanger(plane)).to eq false
  end

  it 'allows a plane to take off and confirms that it is no longer in the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.hanger << plane
    allow(airport).to receive(:weather) { "sunny" }
    airport.take_off(plane)
    expect(airport.check_hanger(plane)).to eq false
  end

  it 'returns an error in take off when weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    airport.hanger << plane
    allow(airport).to receive(:weather) { "stormy" }
    expect { airport.take_off(plane) }.to raise_error "Cannot take off, weather is stormy."
  end

  it 'returns an error in land when weather is stormy' do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.land(Plane.new) }.to raise_error "Cannot land, weather is stormy."
  end

  it 'raises an error when landing a plane in a full airport with a capacity of 1' do
    airport = Airport.new(1)
    airport.hanger << Plane.new
    allow(airport).to receive(:weather) { "sunny" }
    expect { airport.land(Plane.new) }.to raise_error "Cannot land, airport is full."
  end

  it 'returns a new airport with a default capacity of 20' do
    expect(subject.capacity).to eq 20
  end

  it "raises an error when trying to take off a plane that isn't in the airport" do
    expect{subject.take_off(Plane.new)}.to raise_error "Cannot take off, plane is not in airport."
  end

  it 'returns a random number between 0 and 100 when checking the weather' do
    expect(subject.weather).to eq "sunny"
  end

  it 'raises an error when trying to land a plane that is already in the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.hanger << plane
    expect { subject.land(plane)}.to raise_error "Cannot land, plane is already in airport."
  end
end
