require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    before do
      allow(plane).to receive(:land)
      allow(airport).to receive(:rand).and_return(1)
    end

    it 'lands a plane at the airport and must be in the airport hangar' do
      expect(airport.land(plane)).to eq(airport.hangar)
    end

    it 'raises an error and prevents plane landing when the airport is full' do
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'cannot instruct a plane to land if already landed at an airport' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("Plane cannot land if already landed")
    end
  end

  describe '#take_off' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(airport).to receive(:rand).and_return(1)
    end

    it 'instructs a plane to take off and is no longer at the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hangar).to eq([])
    end

    it 'cannot instruct a plane to take off if already flying and not at the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error("Plane is not in this airport")
    end

    it 'raises an error when plane is trying to take off from an airport they are not in' do
      airport2 = Airport.new
      allow(airport2).to receive(:rand).and_return(1)
      airport.land(plane)
      expect { airport2.take_off(plane) }.to raise_error("Plane is not in this airport")
    end
  end

  describe '#override_capacity' do
    it 'overrides the default capacity of the airport' do
      airport.override_capacity(5)
      expect(airport.capacity).to eq(5)
    end
  end

  context "When it is stormy" do

    it 'raises an error and prevents plane landing' do
      allow(airport).to receive(:rand).and_return(10)
      expect { airport.land(plane) }.to raise_error("Plane cannot land due to stormy weather conditions")
    end

    it 'raises an error and prevents plane taking off' do
      allow(airport).to receive(:rand).and_return(1, 10)
      airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error("Plane cannot take off due to stormy weather conditions")
    end
  end

end
