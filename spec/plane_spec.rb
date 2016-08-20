require 'plane'

describe Plane do

subject(:plane) { described_class.new }

  it {is_expected.to respond_to(:landed)}
  it {is_expected.to respond_to(:taken_off)}

  describe '#landed' do
    it 'should return true if the plane has landed' do
      expect(plane.landed).to eq true
    end
  end

  describe '#taken_off' do
    it 'should return false if the plane has taken off' do
      expect(plane.taken_off).to eq false
    end
  end

end
