require 'airport'
require 'plane'

  describe Airport do

	  it 'lands a plane' do
      airport = Airport.new
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'tells plane to take off' do
      airport = Airport.new
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'stores a plane' do
      airport = Aiport.new
      plane = Plane.new
      aiport.land(plane)
      airport.take_off(plane)
      expect(airport.store_planes).not_to include(plane)
    end

   describe '#land_plane' do
	    it 'lands a plane' do
	      planes = Planes.new
	      expect(subject.land_plane).to eq [planes]
	    end
	 end
end
