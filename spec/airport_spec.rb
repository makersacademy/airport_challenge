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
      allow(airport).to receive(:is_stormy?).and_return false #stubbing
    end
  end

  context 'responds to #full?' do
    it 'can check if airport is full' do
      expect(airport).to respond_to(:full?)
    end
  end

  context 'cannot land if #full?' do
    it 'it raises an error if #full?' do
      allow(airport).to receive(:is_stormy?).and_return false #stubbing
      20.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Unable to land: airport full"
    end
  end

  context 'cannot land if #stormy?'do
    it 'does not let the plane land in stormy weather' do
      allow(airport).to receive(:is_stormy?).and_return true #stubbing
      expect { airport.land(plane) }.to raise_error "Unable to land: bad weather"
    end
  end

  describe '#grounded_planes list' do
    it 'stores landed planes in a list' do
      expect(airport.grounded_planes).to be_a(Array)
    end
  end

  describe 'stores plane in #grounded_planes' do
    it 'registers that a landed plane has been stored' do
      airport.land(plane)
      expect(airport.grounded_planes).to eq([plane])
    end
  end

 #-----------------Takeoff-----------------#

  describe '#takeoff(plane)' do
    it 'allows the plane to takeoff in normal weather' do
      expect(airport).to respond_to(:takeoff).with(1).argument
      allow(airport).to receive(:is_stormy?).and_return false #stubbing
    end
  end

  describe 'plane is no longer in #grounded_planes' do
    it 'confirms that the plane is no longer at the airport' do
      airport.takeoff(plane)
      expect(airport.grounded_planes).to eq([]), "Plane has taken off"
    end
  end

  describe 'weather #is_stormy? so plane cannot takeoff' do
    it 'does not let the plane takeoff in stormy weather' do
      allow(airport).to receive(:is_stormy?).and_return true #stubbing
      expect { airport.takeoff(plane) }.to raise_error "Unable to takeoff: bad weather"
    end
  end
end
