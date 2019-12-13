require './lib/airport'

describe Airport do
  context 'Airport allows plane to land' do
    it 'returns true if plane lands' do
      plane = Plane.new
      expect(subject.land_plane).to be true
    end
  end
end
