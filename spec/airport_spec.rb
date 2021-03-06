require 'airport'

describe Airport do
  it "Responds to request_to_land" do
    is_expected.to respond_to :request_to_land
  end

  describe "#request_to_land" do
    it "lands a plane succesfully and responds with a confirmation - 'Plane has landed.'" do
      expect(subject.request_to_land(Plane.new)).to eq "Plane has landed."
    end
  end
end
