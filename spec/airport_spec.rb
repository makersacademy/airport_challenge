require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#capacity' do
    it 'is expected to have a default capacity' do
      shane_airport = airport
      expect(shane_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'is expected to have a user-specified capacity' do
      shane_airport = Airport.new(40)
      expect(shane_airport.capacity).to eq 40
    end
  end

  describe '#plane_land' do
    it 'does not raise error when weather is clear for landing' do
      allow(airport).to receive(:weather?).and_return(false)
      allow(plane).to receive(:land)
      expect{ airport.plane_land(plane) }.to_not raise_error
    end

    it 'raises an error when the airport has inclement weather for landing' do
      allow(airport).to receive(:weather?).and_return(true)
      message = "Cannot land due to inclement weather"
      expect{ airport.plane_land(plane) }.to raise_error message
    end

    it 'confirms that the plane has landed' do
      allow(airport).to receive(:weather?).and_return(false)
      allow(plane).to receive(:land)
      airport.plane_land(plane)
      expect(subject.planes).to include plane
    end

    it 'prevents landing when airport is full' do
      allow(airport).to receive(:weather?).and_return(false)
      allow(airport).to receive(:full?).and_return(true)
      message = "Cannot land as airport is full"
      expect{ airport.plane_land(plane) }.to raise_error message
    end
  end

  describe '#plane_takeoff' do
    it 'instructs a plane to take off' do
      allow(airport).to receive(:weather?).and_return(false)
      allow(plane).to receive(:takeoff)
      airport.plane_takeoff(plane)
    end

    it 'confirms a plane is no longer at the airport after takeoff' do
      allow(airport).to receive(:weather?).and_return(false)
      allow(plane).to receive(:land)
      allow(plane).to receive(:takeoff)
      airport.plane_land(plane)
      airport.plane_takeoff(plane)
      expect(airport.planes).to_not include plane
    end

    it 'prevents takeoff when weather is inclement' do
      allow(airport).to receive(:weather?).and_return(true)
      message = "Cannot take off due to inclement weather"
      expect { airport.plane_takeoff(plane) }.to raise_error message
    end
  end
end
