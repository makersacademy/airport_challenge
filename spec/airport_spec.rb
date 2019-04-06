require 'airport'

describe Airport do

  describe '#land' do
    it 'should allow a user to land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'should allow to instruct a plane to take off' do
      expect(subject.take_off).to eq "The plane has taken off"
    end
  end

end
