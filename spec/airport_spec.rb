require 'airport'
require 'plane'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }
  it 'responds to land_plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  describe '#land_plane' do
    it 'stores plane in the airport' do
      airport.land_plane(plane)
      expect(airport.hangar).to include(plane)
    end

    it 'changes plane status from flying to landed' do
      airport.land_plane(plane)
      expect(plane.flying?).to eq false
    end
  end
end
