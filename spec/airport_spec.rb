require 'airport'
require'plane'

describe Airport do
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:takeoff)}

  describe '#land' do
    it 'Lands a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
  end
end
