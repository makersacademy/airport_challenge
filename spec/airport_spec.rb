require  "airport"
require  "plane"
require "weather"

describe Airport do
  describe "when landing a plane it" do
      before(:each) do
        weather = double("Weather")
        allow(weather).to receive(:stormy?).and_return false
        @airport = Airport.new(weather)
        @plane = Plane.new
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
      weather = double("Weather")
      allow(weather).to receive(:stormy?).and_return false
      @airport = Airport.new(weather)
      @plane = Plane.new
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
    before(:each) do
      weather = double("Weather")
      allow(weather).to receive(:stormy?).and_return true
      @airport = Airport.new(weather)
      @plane = Plane.new
    end
    it "should not let a plane land" do
      p @airport.weather.stormy?
      expect{@airport.land(@plane)}.to raise_error("The plane can't land when the weather is stormy")
    end
    it "should not let a plane take off" do
      expect{@airport.take_off(@plane)}.to raise_error("The plane can't take off when the weather is stormy")
    end
end


end
