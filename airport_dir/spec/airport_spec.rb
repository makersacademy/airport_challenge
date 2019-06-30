require 'airport'

describe Airport do
  describe "airport" do
    it "should have a plane in the airport" do
      airport1 = Airport.new
      plane1 = Plane.new(airport1)
      expect(airport1.airport_hanger[-1]).to eq plane1
  end
end
end


describe Airport do
  describe "airport" do
    it "should not have a plane in the airport" do
      airport1 = Airport.new
      plane1 = Plane.new(airport1)
      plane1.takeoff
      expect(airport1.airport_hanger.include? plane1).to eq false
    end
  end
end

describe Airport do
  describe "airport" do
    it "should have 1 plane in the hanger" do
      airport = Airport.new
      plane1 = Plane.new(airport)
      expect(airport.airport_hanger.count(plane1)).to eq 1
    end
  end
end

describe Airport do
  describe "airport_hanger" do
    it "should have a capacity of 10 when initialised with 10" do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end
end
