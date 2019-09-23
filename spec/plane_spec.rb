require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do

    it 'when a plane lands it is no longer flying' do
      plane.land
      expect(plane).to be_landed
      expect(plane).not_to be_flying
    end
  end

  describe '#takeoff' do

  it 'when plane takes off it is not landed and is flying' do
    plane.land
    plane.takeoff
    expect(plane).not_to be_landed
    expect(plane).to be_flying
  end

  end
end
