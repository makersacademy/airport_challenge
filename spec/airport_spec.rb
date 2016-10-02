require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  context 'when landing a plane' do
    it 'should instruct a plane to land' do
      allow(plane).to receive(:landed?)
      expect(plane).to receive(:land)
      airport.land_plane(plane)
    end
    it 'docks a plane that has landed in the airport' do
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

  it 'releases a plane for take off and confirms it is no longer in the airport' do
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end
end