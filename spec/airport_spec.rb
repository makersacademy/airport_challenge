require 'airport'

describe Airport do

    it "A Airport has a place to store planes within it" do
        airport = Airport.new
        expect(airport.storage).to be_instance_of(Array)
    end

    it "A airport knows it's own name, and can change this" do
        airport = Airport.new
        expect(airport.name).to eq("Heathrow")
        expect(Airport.new(20,"JFK").name).to eq("JFK")
    end

    it "A plane can land at the airport" do
        airport = Airport.new
        plane = Plane.new
        expect{plane.land}.not_to raise_error
    end

    it "A plane can take off from the airport" do
        airport = Airport.new
        plane = Plane.new
        airport.plane_landing(plane)
        expect{plane.take_off}.not_to raise_error
    end

    it "Once a plane has taken off, it is no longer in the airport" do
        airport = Airport.new
        plane = Plane.new
        plane.land
        airport.storage << plane
        airport.plane_taking_off(plane)
        expect(airport.storage).not_to include(plane)
    end

    it "Once a plane has landed, it is in the airport" do
        airport = Airport.new
        plane = Plane.new
        airport.plane_landing(plane)
        expect(airport.storage).to include(plane)
    end

    it "The airport has a default capacity of 20 planes" do
        airport = Airport.new
        expect(airport.capacity).to eq 20
    end

    it "The airport's capacity can be changed upon creation" do
        airport = Airport.new(30)
        expect(airport.capacity).to eq 30
    end

end
