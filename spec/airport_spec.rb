require 'airport'

describe Airport do
  let(:plane) { instance_double("Plane") }

  describe '#land_plane' do

    it 'allows a plane to land' do
      subject.receive_plane(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#release_plane' do

    it 'allows a plane to take off' do
      subject.receive_plane(plane)
      subject.release_plane(plane)
      expect(subject.planes).not_to include plane
    end
  end


end
