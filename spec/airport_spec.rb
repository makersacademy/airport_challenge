require 'airport'

describe 'Plane' do

  describe '#land_plane' do
    it 'can land a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to include(plane)
    end
  end
end