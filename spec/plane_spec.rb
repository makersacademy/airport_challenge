require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:status?) }
  it { is_expected.to respond_to(:landing) }
  it { is_expected.to respond_to(:take_off) }

  describe 'Plane status' do
    it 'set plane status to landed = true' do
      plane.landing
      expect(plane.status?).to eq true
    end

    it 'set plane status to landed = false' do
      subject.take_off
      expect(plane.status?).to eq false
    end
  end
end
