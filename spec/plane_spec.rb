require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off}

  describe '#land' do
    it 'changes plane to landed' do
      plane = Plane.new
      plane.land
      expect(plane.land).to eq true
    end
  end

  describe '#take_off' do
    it 'changes plane to not landed' do
      plane = Plane.new
      plane.land
      expect(plane.take_off).to eq false
    end
  end

end
