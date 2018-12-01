require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'responds to .land_plane' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'only allows planes to .land_plane' do
      plane = Airport.new.land_plane
      expect(plane).to be_kind_of(Plane)
    end
  end

  describe '#release_plane' do
    it 'responds to .release_plane' do
      expect(subject).to respond_to(:release_plane)
    end

    it 'only allows planes to .release_plane' do
      plane = Airport.new.release_plane
      expect(plane).to be_kind_of(Plane)
    end
  end
end
