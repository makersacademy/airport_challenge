require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

describe Plane do
  describe "#land method" do
    it "makes a plane land at a specified airport" do 
      flightA = Plane.new
      gatwick = Airport.new
      flightA.land(gatwick)
      expect(gatwick.planes).to include(flightA)
    end  

    it "prevent landing when airport is at max capacity" do
      flightA = Plane.new
      gatwick = Airport.new
      gatwick.MAX_CAPACITY.times{gatwick.planes.push(Plane.new)}
      expect(flightA.land(gatwick)).to eq("Plane cannot land, airport is at full capacity")
    end
  end

  describe "#take_off method" do
    it "makes a plane take off from a specified airport" do
      flightA = Plane.new
      gatwick = Airport.new
      flightA.take_off(gatwick)
      expect(gatwick.planes).not_to include(flightA)
    end
  end

  describe "#at_airport? method" do
    it "checks if a specified plane is at a specified airport (case false)" do
      flightA = Plane.new
      gatwick = Airport.new
      expect(flightA.at_airport?(gatwick)).to eq("Plane is not at this airport")
    end

    it "checks if a specified plane is at a specified airport (case true)" do
      flightA = Plane.new
      gatwick = Airport.new
      flightA.land(gatwick)
      expect(flightA.at_airport?(gatwick)).to eq("Plane is at this airport")
    end
  end

  describe "#MAX_CAPACITY instance constant" do
    it "can be overriden by user input" do
      gatwick = Airport.new(30)
      expect(gatwick.MAX_CAPACITY).to eq(30)
    end
  end

  describe "#status of plane preventing plane for flying/landing again when it has already done so" do
    it "doesn't land when it has already landed" do 
      flightA = Plane.new
      gatwick = Airport.new
      flightA.land(gatwick)
      expect(flightA.land(gatwick)).to eq("This plane has already landed!")
    end

    it "doesn't take off when it has already taken off" do
      flightA = Plane.new
      gatwick = Airport.new
      flightA.take_off(gatwick)
      expect(flightA.take_off(gatwick)).to eq("This plane is already flying!")
    end
  end
end