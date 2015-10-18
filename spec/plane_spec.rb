require 'plane'

describe Plane do

  describe '#land' do
    it '-sets the plane to land' do
      subject.land
      expect(subject.landing).to eq true
    end
  end

  describe '#take off' do
    it '-sets a plane to take off' do
      subject.land
      subject.landed
      subject.take_off
      expect(subject.takeoff).to eq true
    end
  end

  describe '#flying' do
    it 'cannot take off when already flying' do
      expect{ subject.take_off }.to raise_error("a flying plane cannot take off")
    end
  end
end
