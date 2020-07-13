require 'airport'
describe Airport do
  describe '#land' do
    it 'can land a plane that is in the air' do
      plane = double(:plane, flying: true, :to_ground => false)
      expect(subject.land(plane)).to include(plane)
    end
    it 'raises an error when trying to land a grounded plane' do
      plane = double(:plane, flying: false)
      expect { subject.land(plane) }.to raise_error "This plane is grounded"
    end
  end
  describe '#takeoff' do
    it 'can allow a plane to takeoff' do
      plane = double(:plane, flying: false, :to_air => true)
      expect(subject.takeoff(plane)).to eq(plane)
    end
    it 'removes a plane from the airport once it has taken off' do
      plane = double(:plane, flying: false)
      allow(plane).to receive(:to_air).and_return(true)
      subject.takeoff(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
  it 'has a default capacity of planes' do
    plane = double(:plane, flying: true, :to_ground => false)
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Airport is at maximum capacity"
  end
  it 'has a capacity that can be set when initialized' do
    airport = Airport.new(30)
    plane = double(:plane, flying: true, :to_ground => false)
    30.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Airport is at maximum capacity"
  end
end
