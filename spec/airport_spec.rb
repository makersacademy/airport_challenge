require 'airport'
require 'plane'
require 'weather'

describe Airport do

  #--------Set Subject--------#

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

 #----------------------------------Land----------------------------------#

  describe '#land(plane)' do
    it 'instructs a plane to land at an airport' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'checks if airport is full' do
      expect(airport).to respond_to(:full?)
    end

    it 'prevents landing when the airport is full' do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:landed?) { false }
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Unable to land: airport full"
    end

    it 'prevents landing when weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      allow(airport).to receive(:landed?) { false }
      expect { airport.land(plane) }.to raise_error "Unable to land: bad weather"
    end

    it 'prevents a landed plane from landing again' do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:landed?) { false }
      airport.land(plane)
      allow(airport).to receive(:landed?) { true }
      expect { airport.land(plane) }.to raise_error "Unable to land: plane already in airport!"
    end

    it 'registers that a landed plane has been stored' do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:landed?) { false }
      airport.land(plane)
      expect(airport.grounded_planes).to eq([plane])
    end
  end

 #----------------------------------Takeoff----------------------------------#

  describe '#takeoff(plane)' do
    it 'instructs a plane to take off from an airport' do
      expect(airport).to respond_to(:takeoff).with(1).argument
      allow(airport).to receive(:stormy?) { false }
    end

    it 'confirms that the plane is no longer in the airport' do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:empty?) { false }
      expect(airport.takeoff(plane)).to eq("Plane has taken off")
    end

    it 'only allows planes already in airport to takeoff' do
      allow(airport).to receive(:stormy?) { false }
      expect { airport.takeoff(plane) }.to raise_error "Unable to takeoff: no planes in airport"
    end

    it 'prevents takeoff when weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.takeoff(plane) }.to raise_error "Unable to takeoff: bad weather"
    end
  end
end
