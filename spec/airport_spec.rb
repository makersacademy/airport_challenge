require 'plane'
require 'airport'

describe Airport do

    it "lands a plane at an airport" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.hanger.last).to eq plane
    end

    it "takes off from an airport" do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.hanger.last).to eq nil
    end

    it "can't land if airport is full" do       
        subject.land(Plane.new)
        plane_2 = Plane.new

        expect { subject.land(plane_2) }.to raise_error "Airport is full"
    end

    it "has a default capacity of 1" do
        expect(subject.hanger_capacity).to eq 1
    end

    it "when initializing, can override the default capacity to 5" do
        airport = Airport.new(5)
        expect(airport.hanger_capacity).to eq 5
    end

    it "after initializing, can override the default capacity to 5" do
        subject.hanger_capacity = 5
        expect(subject.hanger_capacity).to eq 5
    end

end