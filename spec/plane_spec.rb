require 'plane'

describe 'plane' do
  describe ':land' do
    plane = Plane.new
    it 'tests whether an instance of plane responds to land method' do
      expect(plane).to respond_to :land
    end

    it 'tests whether a landed plan has been added to the array' do
      plane.land(plane)
      expect($planes_landed). to include(plane)
    end
  end

  describe 'has_landed?' do
    plane = Plane.new
    plane.land(plane)
    it 'tests whether plane responds to :has_landed?' do
      expect(plane). to respond_to :has_landed?
    end

    it 'confirms that the plane has landed' do
      expect(plane.has_landed?(plane)). to be true
    end

  end

end
