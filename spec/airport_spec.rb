require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe '#take_off' do
    it 'plane takes off from airport' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq plane
    end
  end
end
