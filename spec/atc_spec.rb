require "atc.rb"
require "plane.rb"
require "airport.rb"


describe Atc do
  
  describe "#check_location" do
    it "is a method that accepts 1 argument" do
      atc = Atc.new
      expect(atc).to respond_to(:check_location).with(1).arguments
    end

    it "returns location of Plane instance" do
      atc = Atc.new
      plane = Plane.new
      plane.location = "airport"
      expect(atc.check_location(plane)).to eq("airport")
    end
  end

  describe "#instruct_landing" do
    it "is a method that accepts 2 arguments" do
      atc = Atc.new
      expect(atc).to respond_to(:instruct_landing).with(2).arguments
    end

    it "sets a Plane's location to given Airport" do
      atc = Atc.new
      plane = Plane.new
      airport = Airport.new
      expect(atc.instruct_landing(plane, airport)).to eq(airport)
    end
  end

    describe "#instruct_takeoff" do
    it "is a method that accepts 1 argument" do
      atc = Atc.new
      expect(atc).to respond_to(:instruct_takeoff).with(1).arguments
    end

    it "sets a Plane's location to 'in the sky'" do
      atc = Atc.new
      plane = Plane.new
      expect(atc.instruct_takeoff(plane)).to eq('in the sky')
    end
  end

end


