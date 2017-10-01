require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  subject(:plane) {instance_double("Plane")}

  before(:each) do
    allow(airport).to receive(:cleared?) {true} 
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  describe '#planes' do
  
    it 'has a default capacity of 10' do
      expect(Airport::DEFAULT_CAPACITY).to eq 10
    end
    it 'allows to override default capacity' do
      expect(Airport.new(15).capacity).to eq 15
    end
  
  end

  describe '#land' do

    before(:each) do
      allow(plane).to receive(:landed) {false}
    end

    it 'instructs a plane to land at the airport' do
      expect(airport).to receive(:land).with(plane)
      airport.land(plane)
    end
    it 'stores a landed plane in the hangar' do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
    it 'raises error if weather is stormy' do
      allow(airport).to receive(:cleared?) {false}
      expect {airport.land(plane)}.to raise_error 'cannot land in stormy weather'
    end
    it 'raises error if trying to land at a full airport' do
      allow(airport).to receive(:full?) {true}
      expect {airport.land(plane)}.to raise_error 'cannot land at full airport'
    end 
    it 'raises error if already landed' do
      airport.land(plane)
      allow(plane).to receive(:landed) {true}
      expect {airport.land(plane)}.to raise_error 'plane has already landed'
    end

  end

  describe '#take off' do

    before(:each) do
      allow(plane).to receive(:landed) {false}
      airport.land(plane) 
      allow(plane).to receive(:landed) {true}
    end

    it 'instructs a plane to take off from the airport' do
      expect(airport.take_off(plane)).to eq plane
    end
    it 'confirms a plane has left the airport' do
      airport.take_off(plane)
      expect(airport.planes).to_not include(plane)
    end
    it 'raises error if weather is stormy' do
      allow(airport).to receive(:cleared?) {false}
      expect {airport.take_off(plane)}.to raise_error 'cannot take off in stormy weather'
    end
    it 'raises error if already in the air and attempting to take off' do
      airport.take_off(plane)
      allow(plane).to receive(:landed) {false}
      expect {airport.take_off(plane)}.to raise_error 'plane is already in the air'
    end
    it 'raises error if in a different airport' do
      airport.take_off(plane)
      allow(plane).to receive(:landed) {true}
      expect {airport.take_off(plane)}.to raise_error 'plane is not at this airport'
    end
  end

end