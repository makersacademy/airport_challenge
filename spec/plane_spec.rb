require 'plane'

describe Plane do
  let(:plane) { described_class.new }

  describe '#new' do
    it 'returns a new plane object' do
      expect(plane).to be_an_instance_of(Plane)
    end
  end

  describe '#land' do
    it 'returns true when plane lands' do
      expect(plane.land).to eq true
    end
  end

  describe '#takeoff' do
    it 'returns false when plane takeoff' do
      expect(plane.takeoff).to eq false
    end
  end
end
