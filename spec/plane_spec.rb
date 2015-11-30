require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do
    before do
      plane.take_off
    end
    it 'sets flying status to false' do
      plane.land
      expect(plane.flying?).to be false
    end
    it 'can not land when is not flying' do
      plane.land
      msg = 'Unable to land cause is not flying'
      expect { plane.land }.to raise_error msg
    end
  end

  describe '#take_off' do
    it 'sets flying status to true' do
      plane.take_off
      expect(plane.flying?).to be true
    end
    it 'can not take off when is already flying' do
      plane.take_off
      msg = 'Unable to take off cause is already flying'
      expect { plane.take_off }.to raise_error msg
    end
  end
end
