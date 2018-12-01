require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  describe '#land' do
    it 'responds to .land(plane)' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'only allows .land argument to be kind of plane' do
      plane = Airport.new.land(plane)
      expect(plane).to be_kind_of(Plane)
    end
  end

  describe '#release' do
    it 'responds to .release(plane)' do
      expect(airport).to respond_to(:release).with(1).argument
    end

    it 'only allows planes to .release_plane' do
      plane = Airport.new.release(plane)
      expect(plane).to be_kind_of(Plane)
    end
  end
end
