require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  it { is_expected.to respond_to(:stationed?) }
  it { is_expected.to respond_to(:take_off) }

  describe '#take_off' do
    it 'changes the status of the plane after telling it to take off' do
      expect(plane.take_off).to eq 'in the air'
    end
  end

  describe '#stationed?' do
    it 'checks the status of the plane' do
      expect(plane.stationed?).to eq true
      plane.take_off
      expect(plane.stationed?).to eq false
    end
  end
end
