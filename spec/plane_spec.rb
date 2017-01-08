
require "plane"
require "airport"


describe Plane do

  describe "in_flight?" do
    context "checks the status of the plane" do
      it "returns 'In Flight' if true, 'Landed' if false. Default 'In Flight.'" do
        plane = Plane.new
        expect(plane.in_flight?).to eq('In Flight.')
      end
    end
  end
end

describe Airport do

  describe ".land" do
      it "tells a plane to land" do
        airport = Airport.new
        plane = Plane.new
        expect(airport).to respond_to(:land).with(1).argument
    end
  end
end
