require 'airport'

describe Airport do

  describe 'land' do
    it 'allows a plane to land' do
      plane = Plane.new
      expect(subject).to respond_to (:land)
      subject.land(plane)
    end
  end


end
