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