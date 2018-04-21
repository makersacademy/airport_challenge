require 'airport'
require 'plane'

describe Airport do
  let(:plane) {double :plane, landed: false, land: true}
  let(:landed_plane) {double :plane, landed: true, take_off: false}

  describe '#plane_lands' do
    it 'shows plane in airport once it lands' do
      subject.plane_lands(plane)
      expect(subject.planes.last).to eq plane
    end
  end

  describe '#plane_take_off' do
    it 'shows plane has left airport once it takes off' do
      subject.plane_take_off(landed_plane)
      expect(subject.planes.include? plane).to eq false
    end

  end

end
