require 'plane'
require 'weather'
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

    it 'raises an error if a plane tries to land and the airport is full' do
      Plane::DEFAULT_CAPACITY.times { Plane.new.land Plane.new }
      expect(Plane.new.land(Plane.new)).to raise_error 'Airport is full.'
    end
  end

  describe 'landed?' do
    plane = Plane.new
    plane.land(plane)
    it 'tests whether plane responds to :landed?' do
      expect(plane). to respond_to :landed?
    end

    # it 'confirms that the plane has landed' do
    #   expect(plane.has_landed?(plane)). to be true
    # end

  end

  describe 'take_off' do
    plane = Plane.new
    it 'tests whether the plane responds to :take_off' do
      expect(plane). to respond_to :take_off
    end

    it 'moves the plane from the landed array to the in air array' do
      plane.take_off(plane)
      expect($planes_in_air).to include(plane)
    end
  end

end
