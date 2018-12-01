require 'airport'

describe Airport do
  subject(:airport) { Airport.new }


  describe '#land' do
    it 'responds to .land(plane)' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'expects .land to return plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it 'expects .plane to return landed plane ID' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.plane).to eq plane
    end
  end

  describe '#release' do
    it 'responds to .release_plane' do
      expect(airport).to respond_to(:release_plane)
    end

    it 'expects .plane to return released plane ID' do
      plane = Plane.new
      airport.land(plane)
      expect {airport.release_plane}.to output("#{plane} departed").to_stdout
    end
  end

end
