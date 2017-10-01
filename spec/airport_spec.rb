require 'airport'


describe Airport do

  describe '#land_at_airport' do
    it 'allows a plane to be landed' do
      plane = Plane.new
      expect(subject.land_at_airport(plane)).to eq plane
    end
  end

  describe '#take_off'
    it 'allows a plane to take off and confirms take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq plane
    end

end
