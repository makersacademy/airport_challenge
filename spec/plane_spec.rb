require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do
    it { is_expected.to respond_to(:land) }
    before do
      plane.take_off
    end
    it 'sets flying status to false' do
      plane.land
      expect(plane.flying?).to be false
    end
    it 'can not land when is not flying' do
      plane.land
      message = 'Unable to land cause is not flying'
      expect { plane.land }.to raise_error message
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it 'sets flying status to true' do
      plane.take_off
      expect(plane.flying?).to be true
    end
    it 'can not take off when is already flying' do
      plane.take_off
      message = 'Unable to take off cause is already flying'
      expect { plane.take_off }.to raise_error message
    end
  end
end
