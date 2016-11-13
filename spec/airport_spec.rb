require  "airport"
require  "plane"

describe Airport do
  context "when created it" do
    it {is_expected.to be_a(Object)}
    it {is_expected.to respond_to(:land)}
    it {is_expected.to respond_to(:land).with(1).argument}
  end
  describe "when landing a plane" do
      before(:each) do
        @plane = Plane.new
        @airport = Airport.new
        @airport.land(@plane)
      end
      it "should have a 'planes' getter method" do
        expect(@airport).to respond_to(:planes)
      end
      it "should keep track of the planes" do
        expect(@airport.planes.count).to be 1
      end
  end


end
