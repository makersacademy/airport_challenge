require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'should let a plane land at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end
