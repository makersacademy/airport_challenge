require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane, flying: true, land: false }
  let(:plane_in_airport) { double :plane, flying: false, take_off: true }

  describe '#lands_plane' do
    it 'shows plane in airport once it has landed' do
      subject.lands_plane(plane)
      expect(subject.planes.last).to eq plane
    end
  end

  describe '#takes_off_plane' do
    it 'shows plane no longer in airport once it has taken off' do
      subject.takes_off_plane(plane_in_airport)
      expect(subject.planes.include?(plane_in_airport)).to eq false
    end
  end
end
