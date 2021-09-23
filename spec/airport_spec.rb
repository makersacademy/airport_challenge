require 'airport'
require 'plane'

describe Airport do
  describe "#land" do
    it "lets a plane land at an airport" do
      plane = Plane.new
      
      subject.land(plane)
      expect(subject.planes).to include plane  
    end

    it "confirms that the plane is no longer flying" do
      plane = Plane.new
      
      subject.land(plane)
      expect(plane.flying).to eq false
    end
  end
end
