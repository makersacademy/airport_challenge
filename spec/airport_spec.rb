require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(40) }

  describe '#land' do
    it 'instructs a plane to land' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

  describe 'when full' do
    it 'raises error' do
      40.times do
        airport.land(:plane)
      end
      expect { airport.land(:plane) }.to raise_error "Full to capacity: Landing Denied. Proceed to default airport"   
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      airport = Airport.new
      plane = Plane.new
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end

  context 'defaults' do

    it 'has a default capacity' do
       
      airport = Airport.new
      plane = Plane.new
    #   default_airport { described_class.new }
      described_class::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.not_to raise_error 'Full to capacity: Landing Denied. Please land at default airport instead'
    end
  end

  describe 'default_airport' do
    it 'accepts overflowing plane' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

end
