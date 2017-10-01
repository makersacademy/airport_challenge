require 'airport'
require 'weather'
require 'plane'

describe Airport do

  subject(:airport) {Airport.new}
  subject(:plane) {Plane.new}

  before do
    allow(airport).to receive(:cleared?) {true}
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

    it 'instructs a plane to land at the airport' do
      expect(airport.land(plane)).to include(plane)
    end
    it 'stores a landed plane in the hangar' do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
    it 'allows a plane to land again once taken off' do
      airport.land(plane)
      airport.take_off(plane)
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
      expect {airport.land(plane)}.to raise_error 'plane has already landed'
    end

  end

  describe '#take off' do

    it 'instructs a plane to take off from the airport' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it 'confirms a plane has left the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to_not include(plane)
    end
    it 'raises error if weather is stormy' do
      airport.land(plane)
      allow(airport).to receive(:cleared?) {false}
      expect {airport.take_off(plane)}.to raise_error 'cannot take off in stormy weather'
    end
    it 'raises error if already in the air and attempting to take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect {airport.take_off(plane)}.to raise_error 'plane is already in the air'
    end
    it 'raises error if in a different airport' do
      Airport.new.land(plane)
      expect {airport.take_off(plane)}.to raise_error 'plane is not at this airport'
    end
  end

end