require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'instructs a plane to land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end
