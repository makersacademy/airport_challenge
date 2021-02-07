require "plane.rb"
require "airport.rb"

describe "Airport and Plane:" do
  let(:airport) { Airport.new("sunny", 10)}
  let(:plane) { Plane.new}

  context "good weather:" do
    it "plane lands at the airport" do
      expect(airport.planes).not_to include(plane)
      expect(plane.location).not_to eq airport
      plan.land(airport)
      expect(airport.planes).to include(plane)
      expect(plane.location).to eq airport
    end

    it "plane takes off from airport" do
    end
  end

  context "bad weather:" do
    it "plane cannot land at the airport" do
      
    end

    it "plane cannot take off from the airport" do
      
    end
  end

  context "multiple planes" do
    it "3 planes land at the airport" do
      
    end

    it "3 planes try to land, but airport is full after 2nd" do
      
    end

    it "weather changes for the worse" do
      
    end

    it "weather changes for the best" do
      
    end
  end
end