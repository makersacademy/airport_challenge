require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  it { is_expected.to respond_to(:status) }
  it { is_expected.to respond_to(:flight_number) }

  describe '#landed' do
    it 'should change flight airborne status upon landing' do
      plane.landed
      expect(plane.airborne?).to eq false
    end
  end

  describe '#takeoff' do
    it 'should change flight airborne status upon takeoff' do
      plane.landed
      plane.takeoff
      expect(plane).to be_airborne
    end
  end

end
