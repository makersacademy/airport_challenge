require 'airport'

describe Airport do

  describe '#land' do
    it 'responds to .land(plane)' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'only allows .land argument to be kind of plane' do
      plane = Airport.new.land(plane)
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
