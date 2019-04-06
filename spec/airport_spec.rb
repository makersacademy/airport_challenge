require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
  end

end
