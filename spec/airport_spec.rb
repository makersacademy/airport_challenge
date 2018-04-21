require 'airport'

describe Airport do
  let(:flying_plane) { instance_double("Plane", land: self) }

  describe '#land_plane' do

    it 'allows a plane to land' do
      subject.receive_plane(flying_plane)
      expect(subject.planes).to include flying_plane
    end
  end


end
