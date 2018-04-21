require 'airport'
require 'plane'

describe Airport do
  describe "#land" do
    it 'should allow a plane to land' do
      expect(subject).to respond_to(:land)
    end
    it 'should show that plane is in the airport' do
      a_plane = Plane.new
      expect(subject.land(a_plane)).to eq a_plane
    end
  end
end
