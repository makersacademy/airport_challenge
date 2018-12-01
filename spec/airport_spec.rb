require 'airport'

describe Airport do
  subject(:airport) { Airport.new }


  describe '#land' do

    it 'expects .land(plane) to return plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it 'expects .plane to return landed plane ID' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.plane).to eq plane
    end

  end

  describe '#release_plane' do
     
    it 'expects .release_plane to return released plane ID' do
      plane = Plane.new
      airport.land(plane)
      expect {airport.release_plane}.to output("#{plane} departed").to_stdout
    end

  end

end
