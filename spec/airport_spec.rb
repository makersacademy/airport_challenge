require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    before do
      allow(plane).to receive(:land)
      allow(airport.weather).to receive(:stormy?).and_return(false)
      #allow(weather).to receive(:stormy?).and_return(false)
    end

    it 'lands a plane at the airport and must be in the airport hangar' do
      airport.land(plane)
      expect(airport.hangar).to include plane
    end

    it 'raises an error and prevents plane landing when the airport is full' do
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'cannot instruct a plane to land if already landed at an airport' do
      airport.land(plane)
      message = "Plane cannot land if already landed"
      expect { airport.land(plane) }.to raise_error message
    end
  end

  describe '#take_off' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(airport.weather).to receive(:stormy?).and_return(false)
    end

    it 'instructs a plane to take off and is no longer at the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hangar).to eq([])
    end

    it 'removes correct plane from hangar when there are multiple planes' do
      plane2 = Plane.new
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      expect(airport.hangar).not_to include(plane)
    end

    it 'cannot instruct a plane to take off if already flying' do
      airport.land(plane)
      airport.take_off(plane)
      message = "Plane is not in this airport"
      expect { airport.take_off(plane) }.to raise_error message
    end

    it 'cannot allow plane to take off from an airport they are not in' do
      airport2 = Airport.new
      allow(airport2.weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      message = "Plane is not in this airport"
      expect { airport2.take_off(plane) }.to raise_error message
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
      allow(airport.weather).to receive(:stormy?).and_return(true)
      message = "Plane cannot land due to stormy weather conditions"
      expect { airport.land(plane) }.to raise_error message
    end

    it 'raises an error and prevents plane taking off' do
      allow(airport.weather).to receive(:stormy?).and_return(false, true)
      airport.land(plane)
      message = "Plane cannot take off due to stormy weather conditions"
      expect { airport.take_off(plane) }.to raise_error message
    end
  end

end
