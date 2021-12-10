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
end

describe Plane do
end