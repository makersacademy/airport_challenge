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

        it "does not allow planes to land if at capacity" do
            airport = Airport.new(0)
            expect { airport.land(@plane) }.to raise_error 'The airport is at max capacity'
        end

        it "does not allow planes to land if already landed" do
            @airport.land(@plane)
            expect { @airport.land(@plane) }.to raise_error 'This plane has already landed'
        end
    end
end