require 'plane'

describe Plane do
  describe '#new' do
    it 'returns a new plane object' do
      expect(subject).to be_an_instance_of(Plane)
    end
  end

  describe '#land' do
    it 'returns true when plane lands' do
      expect(subject.land).to eq true
    end
  end

  describe '#takeoff' do
    it 'returns false when plane takeoff' do
      expect(subject.takeoff).to eq false
    end
  end
end
