require 'airport'


describe Airport do

  describe '#land_at_airport' do
    it 'allows a plane to be landed' do
      plane = Plane.new
      expect(subject.land_at_airport(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq plane
    end
    it 'keeps track of taken off planes' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.plane).to eq plane
    end
  end 
end
