require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'should allow a user to land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end
