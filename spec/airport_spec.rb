require "plane"
require "airport"

describe Airport do
    airport = Airport.new("Gatwick")

    it "throws expection when airport is full and trying to land" do
        plane = Plane.new  
        airport.weather = "SUNNY"
        airport.capacity = 0
        expect {airport.taxi(plane)}.to raise_exception "No space for new aircraft"
    end

    it "initializes a default airport capacity" do
        airport = Airport.new("Heathrow")
        expect(airport.capacity).to eq(3)
    end

    it "lands a plane at a specific airport" do
        plane = Plane.new
        plane.status = "IN-AIR"
        airport.weather = "SUNNY"
        expect(airport.taxi(plane)).to match_array([plane])
    end 

    it "throws weather warning error if conditions are poor" do
        plane = Plane.new
        airport.hanger << plane
        airport.weather = "STORMY"
        plane.status = "GROUNDED"
        expect {airport.depart(plane)}.to raise_exception "Conditions are unfavourable"
    end

    it "throws exception when weather conditions are poor for landing" do
        plane = Plane.new
        airport.weather = "STORMY"
        plane.status = "IN-AIR"
        expect {airport.taxi(plane)}.to raise_exception "Conditions are unfavourable"
    end

    it "takes off specific plane from the hanger" do
        specific_plane = Plane.new
        airport.hanger << specific_plane
        2.times { airport.hanger << Plane.new }
        airport.weather = "SUNNY"
        expect(airport.depart(specific_plane)).not_to include(specific_plane)
        expect(specific_plane.status).to eq("IN-AIR")
    end

    it "raises err when trying to take off a plane when there are no planes in hanger" do
        plane = Plane.new
        expect {airport.depart(plane)}.to raise_exception "There are no planes to takeoff"
    end        
end
