require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'Lands a plane' do
      expect(subject).to respond_to :land_plane
    end
  end

  describe '#take_off' do
    it 'Instructs a plane to take off' do
      expect(subject.plane).to respond_to :take_off
    end
  end
end
