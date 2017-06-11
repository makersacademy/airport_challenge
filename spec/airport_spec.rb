require "airport.rb"

describe Airport do

let (:airport) {Airport.new}

  describe "#land" do

      it "responds to land method" do
      expect(airport).to respond_to :land
      end

      it "can land a specified plane" do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
      end

      it "returns error if plane already landed" do
      plane = Plane.new
      airport.land(plane)
      expect{(airport.land(plane))}.to raise_error("Plane already landed")
      end

      it "returns landed planes" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

  end
end
