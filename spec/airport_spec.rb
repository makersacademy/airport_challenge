require 'airport'

describe Airport do

  describe "#land" do
    it "it expects aiport to respond to land" do
      expect(subject).to respond_to :land
    end
    it "lands a plane at the airport" do
      plane = Plane.new
      expect(subject.land(plane)). to eq(plane)
    end
  end

end
