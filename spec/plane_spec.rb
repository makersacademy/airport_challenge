require 'plane'

RSpec.describe Plane do

  let(:plane) {Plane.new}

  it {is_expected.to respond_to(:land).with(1).argument}

  describe '#land' do

    it 'records plane' do
      expect(subject.land(plane)).to eq plane
    end
  end
end
