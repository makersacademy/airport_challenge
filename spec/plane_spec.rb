require "plane"

describe Plane do

  it { is_expected.to respond_to :landed }

  let(:plane) { Plane.new }

  describe '#land' do
    it 'changes plane to landed status' do
      plane.land
      expect(plane.landed).to eq true
    end
  end

  describe '#take_off' do
    it 'changes plane to not landed status' do
      plane.land
      plane.take_off
      expect(plane.landed).to eq false
    end
  end

end
