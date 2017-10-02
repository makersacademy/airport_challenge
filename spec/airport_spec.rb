require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double("Plane", land: nil, take_off: nil) }

  before(:each) do
    allow(airport).to receive(:cleared?) { true } 
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
      expect(plane).to receive(:land)
      airport.land(plane)
    end
    it 'stores a landed plane in the hangar' do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
    it 'raises error if weather is stormy' do
      allow(airport).to receive(:cleared?) { false }
      expect { airport.land(plane) }.to raise_error 'cannot land in stormy weather'
    end
    it 'raises error if trying to land at a full airport' do
      allow(airport).to receive(:full?) { true }
      expect { airport.land(plane) }.to raise_error 'cannot land at full airport'
    end

  end

  describe '#take off' do

    before(:each) do
      airport.land(plane)
    end
    
    it 'instructs a plane to take off from the airport' do
      expect(airport.take_off(plane)).to eq plane
    end
    it 'confirms a plane has left the airport' do
      airport.take_off(plane)
      expect(airport.planes).to_not include(plane)
    end
    it 'raises error if weather is stormy' do
      allow(airport).to receive(:cleared?) { false }
      expect { airport.take_off(plane) }.to raise_error 'cannot take off in stormy weather'
    end
    it 'raises error if in a different airport' do
      airport.take_off(plane)
      allow(plane).to receive(:landed) { true }
      expect { airport.take_off(plane) }.to raise_error 'plane is not at this airport'
    end
  end

end
