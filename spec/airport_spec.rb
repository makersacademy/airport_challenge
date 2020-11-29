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

  it 'responds to plane_present? method' do
    expect(subject).to respond_to(:plane_present?).with(1).argument
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

    it 'raises error when airport capacity is full' do
      plane1 = Plane.new
      airport.land_plane(plane)
      expect { airport.land_plane(plane1) }.to raise_error 'hangar full'
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

  describe '#plane_present?' do
    it 'verifies if a specific plane is in the hangar' do
      airport.land_plane(plane)
      expect(airport.plane_present?(plane)).to eq true
    end
  end
end
