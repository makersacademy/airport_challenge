require 'airport'
require 'plane'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }
  it 'responds to land_plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
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

  describe '#take_off' do
    it 'removes plane from airport hangar' do
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.hangar).not_to include(plane)
    end

    it 'changes status of plane from landed to flying' do
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(plane.flying?).to eq true
    end
  end
end
