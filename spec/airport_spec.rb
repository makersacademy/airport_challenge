require "airport"

describe Airport do

    describe "land" do
        it "lands a plane" do
            expect(subject.land(Plane.new)).to eq subject.planes
        end

        it "returns an error when the airport is full" do
           subject.capacity.times {subject.land(Plane.new)}
           expect{raise subject.land(Plane.new)}.to raise_error("The airport is full")
        end

        it "returns an error if the weather is too stormy" do
            allow(subject).to receive(:stormy?) {true}
            expect{raise subject.land(Plane.new)}.to raise_error("The weather is too stormy")
        end 
    end

    describe "take_off" do
        it "removes the plane from the planes array" do
            plane = Plane.new
            subject.land(plane)
            subject.take_off(plane)
            expect(subject.planes).not_to include(plane)
        end

        it "raises an error if the weather is too stormy" do
            plane = Plane.new
            subject.land(plane)
            allow(subject).to receive(:stormy?) {true}
            expect{raise subject.take_off(plane)}. to raise_error("The weather is too stormy")
        end
    end

    describe "capacity" do
        it "sets a default capacity" do
            expect(subject.capacity).to eq Airport::RUNWAY_CAPACITY
        end

        it "overrides the capacity" do
            airport = Airport.new(10)
            expect(airport.capacity).to eq 10
        end
    end

end

