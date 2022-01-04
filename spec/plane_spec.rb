require 'plane'

describe Plane do
  describe '#airborne' do
    it 'is true after taking off' do
      subject.land
      subject.takeoff
      expect(subject.airborne).to eq(true)
    end
    it 'is false after landing' do
      subject.land
      expect(subject.airborne).to eq(false)
    end
  end
  describe '#land' do
    it 'raises an error if the plane is not airborne' do
      subject.land
      expect { subject.land }.to raise_error('Plane is not airborne')
    end
  end
  describe '#takeoff' do
    it 'raises an error if the plane is not airborne' do
      expect { subject.takeoff }.to raise_error('Plane is already airborne')
    end
  end
end
