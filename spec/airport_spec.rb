require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

#-----------------Land-----------------#

  describe '#land(plane)' do
    it 'allows a plane to land in normal weather' do
      expect(airport).to respond_to(:land).with(1).argument
      #allow(airport).to receive(:is_stormy?) {false} #stubbing
    end

    it 'can check if airport is full' do
      expect(airport).to respond_to(:full?)
    end

    it 'it raises an error if #full?' do
      allow(airport).to receive(:is_stormy?) {false} #stubbing
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Unable to land: airport full"
    end

    it 'does not let the plane land in stormy weather' do
      allow(airport).to receive(:is_stormy?) {true} #stubbing
      expect { airport.land(plane) }.to raise_error "Unable to land: bad weather"
    end

    # it 'stores landed planes in a list' do
    #   expect(airport.grounded_planes).to be_a(Array)
    # end

    it 'registers that a landed plane has been stored' do
      airport.land(plane)
      expect(airport.grounded_planes).to eq([plane])
    end
  end
 #-----------------Takeoff-----------------#
  describe '#takeoff(plane)' do
    it 'allows the plane to takeoff in normal weather' do
      expect(airport).to respond_to(:takeoff).with(1).argument
      allow(airport).to receive(:is_stormy?) {false} #stubbing
    end

    it 'only allows planes already in airport to takeoff' do
      allow(airport).to receive(:is_stormy?) {false}
      expect { airport.takeoff(plane) }.to raise_error "Unable to takeoff: no planes in airport"
    end

    # it 'confirms that the plane is no longer at the airport' do
    #   airport.takeoff(plane)
    #   expect(airport.grounded_planes).to eq([]), "Plane has taken off"
    # end

    it 'does not let the plane takeoff in stormy weather' do
      allow(airport).to receive(:is_stormy?) {true} #stubbing
      expect { airport.takeoff(plane) }.to raise_error "Unable to takeoff: bad weather"
    end
  end
end
