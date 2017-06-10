require "airport.rb"

describe Airport do

let (:airport) {Airport.new}

describe "#land" do
      it "responds to land method" do
        expect(airport).to respond_to :land
      end

      it "can land a specified plane" do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane.land 
    end
  end
end
