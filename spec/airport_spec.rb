require "airport"

describe Airport do

    before(:each) do
        @airport = Airport.new
        @plane = Plane.new
    end

    it "can change capacity" do
        airport = Airport.new(5)
        expect(airport.capacity).to eq(5)
    end

    it "has a default capacity of 10" do
        expect(@airport.capacity).to eq(10)
    end

    describe "#land" do
        it "can land a plane in the airport" do
            @airport.land(@plane)
            expect(@airport.landed_planes).to include(@plane)
        end
    end
end