require  "airport"
require  "plane"

describe Airport do
  context "when created it" do
    it {is_expected.to be_a(Object)}
    it {is_expected.to respond_to(:land)}
    it {is_expected.to respond_to(:land).with(1).argument}
    it {is_expected.to respond_to(:take_off).with(1).argument}
  end
  describe "when landing a plane it" do
      before(:each) do
        @plane = Plane.new
        @airport = Airport.new
      end
      it "should have a 'planes' getter method" do
        expect(@airport).to respond_to(:planes)
      end
      it "should have an 'add(plane)' method " do
        expect(@airport.add(@plane)).to eq [@plane]
      end
      it "should have a 'confirm_landing' method" do
        expect(@airport).to respond_to(:confirm_landing)
      end
      it "should confirm if the plane has landed" do
        expect(@airport.land(@plane)).to eq "The plane #{@plane} has landed"
      end
      it "should keep track of the planes that landed" do
        @airport.land(@plane)
        expect(@airport.planes.count).to be 1
      end
  end
  describe "when a plane takes off" do
    before(:each) do
      @plane = Plane.new
      @airport = Airport.new
      @airport.land(@plane)
    end
    it "should contain a 'delete(plane)' method" do
      expect(@airport.delete(@plane)).to eq @plane
    end

    it "should delete the plane from the list" do
      @airport.take_off(@plane)
      expect(@airport.planes.count).to eq 0
    end
    it "should confirm the plane has taken off" do
      expect(@airport.take_off(@plane)).to eq "The plane #{@plane} has taken off"
    end
  end
  describe "when weather is stormy" do

  end


end
