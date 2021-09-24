require 'airport'
require 'plane'

describe Airport do
  describe "#land" do
    it "instructs a plane to land at the airport" do
      plane = Plane.new
      subject.land(plane)

      expect(subject.planes).to include plane
    end
  end
end