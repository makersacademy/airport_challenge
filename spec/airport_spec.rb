require 'airport'

describe Airport do

  describe '#initialize' do
    it 'initializes with an empty array' do
        expect(subject.hangar).to eq []
    end 
  end 

  describe '#land' do
    it 'can land a plane at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end 

  describe '#take_off' do
    it 'allows a plane to take off and confirms that it is in the air' do
        plane = Plane.new
        expect(subject.take_off(plane)).to eq "Plane is airborne"
    end
  end 



end 