require 'airport'
require 'plane'

describe Airport do
  let (:plane) {double :plane}

  it {is_expected.to respond_to(:land_plane)}
  describe '#land_plane' do
    it 'lands planes' do
      expect{subject.land_plane(plane)}.to change{subject.planes.length}.by(1)
    end
  end

  it {is_expected.to respond_to(:clear_plane_for_take_off)}
  describe '#clear_plane_for_take_off' do
    it 'clears planes to take off' do
      subject.land_plane(plane)
      expect{subject.clear_plane_for_take_off}.to change{subject.planes.length}.by(-1)
    end
  end
end
