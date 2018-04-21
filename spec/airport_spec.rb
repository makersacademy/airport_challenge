require 'airport'
require 'plane'

describe Airport do
  describe "#land" do
    it 'should allow a plane to land' do
      expect(subject).to respond_to(:land)
    end
  end

  describe "#take_off" do
    it 'should allow a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end
  end

  describe "#planes" do
    it 'should show that the plane is in the airport' do
      a_plane = Plane.new
      subject.land(a_plane)
      expect(subject.planes).to eq [a_plane]
    end
    it 'should show that the the plane is no longer in the airport' do
      a_plane = Plane.new
      subject.land(a_plane)
      subject.take_off
      expect(subject.planes).to eq []
    end
  end

end
