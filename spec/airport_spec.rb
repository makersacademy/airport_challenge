require 'airport'

describe Airport do

  describe 'land' do
    it 'allows a plane to land' do
      plane = Plane.new
      expect(subject).to respond_to :land
      subject.land(plane)
    end
  end

  describe 'take off' do
    it 'allows a plane to take off' do
      plane = Plane.new
      expect(subject).to respond_to :takeoff
      subject.takeoff(plane)
    end
  end

end
