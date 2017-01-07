require 'airport'

describe Plane do

  describe "#landed?" do

    before do
      @plane = Plane.new
      @airport = Airport.new
    end

    context "if the plane has landed" do

      it "returns true" do
        @airport.land(@plane)
        expect(@plane.landed?(@airport)).to eq true
      end
    end

    context "if the plane hasn't landed" do

      it "returns false" do
        expect(@plane.landed?(@airport)).to eq false
      end
    end
  end

end
