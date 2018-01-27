require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do 
    it 'allows planes to land' do 
      plane = Plane.new
      expect(subject.land(plane)).to match_array([plane])
    end
  end

  describe '#take_off' do 
    it 'allows planes to take off' do 
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to match_array([])
    end
  end
end