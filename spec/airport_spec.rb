require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land) }
  end

  describe '#land plane' do 
    it 'lands the plane' do 
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe 'airport at full capacity' do
    it 'raises error if airport has 1 plane landed already and second plane tries to land' do 
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error "Airport at full capacity"
    end
  end

  describe '#depart plane' do 
    it 'removes the plane from airport' do 
      plane = Plane.new
      subject.land(plane)
      expect(subject.depart(plane)).not_to eq plane
    end
  end
end

describe Plane do
end