require 'airport'
require 'plane'

describe Airport do

  let(:plane) { Plane.new }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane' do
      expect(subject.land(plane)).to eq plane
    end
  end
end
