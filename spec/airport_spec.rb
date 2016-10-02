require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  context 'when landing a plane' do
    it 'instructs a plane to land' do
      allow(plane).to receive(:landed?)
      expect(plane).to receive(:land)
      airport.land_plane(plane)
    end
    it 'only docks a plane that has landed in the airport' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return true
      airport.land_plane(plane)
      expect(airport.planes).to include plane 
    end
    it 'cannot dock a plane that has not landed' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return false
      airport.land_plane(plane)
      expect(airport.planes).not_to include plane
    end
  end

  context 'when allowing planes to take off' do
    it 'instructs a plane to take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return true
      airport.land_plane(plane)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end
    it 'cannot instruct a plane to take off if it is not in the airport' do
      allow(plane).to receive(:take_off)
      expect{ airport.take_off(plane) }.to raise_error("The plane is not in the airport!")
    end
    it 'does not have a plane after it has taken off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return true
      allow(plane).to receive(:take_off)
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end
end