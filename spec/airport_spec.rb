require 'airport_challenge'

describe Airport do
  it 'lands a plane' do
    allow(subject).to receive(:weather) { "sunny" }
    expect(subject.land(Plane.new)).to eq true
  end

  it 'allows a plane to take off' do
    allow(subject).to receive(:weather) { "sunny" }
    expect(subject.take_off(Plane.new)).to eq true
  end

  it 'allows a plane to take off and confirms that it is no longer in the airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
    expect(subject.check(plane)).to eq false
  end

  it 'returns an error in take off when weather is stormy' do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.take_off(Plane.new) }.to raise_error "Cannot take off, weather is stormy."
  end

  it 'returns an error in land when weather is stormy' do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.land(Plane.new) }.to raise_error "Cannot land, weather is stormy."
  end

  it 'raises an error when landing a plane in a full airport with a capacity of 1' do
    airport = Airport.new(1)
    airport.hanger << Plane.new
    allow(subject).to receive(:weather) { "sunny" }
    expect { airport.land(Plane.new) }.to raise_error "Cannot land, airport is full."
  end

  it 'returns a new airport with a default capacity of 20' do
    expect(subject.capacity).to eq 20
  end
end
