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

  describe 'Checking the status of planes?' do

    it 'allows the user to check the status of a plane' do
      expect(plane.status?).to be(true).or be(false)
    end

    it 'allows the user to check where the plane is' do
      expect(plane.check?).to be_a_kind_of(String)
    end
  end
end
