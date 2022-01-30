require 'plane'
require 'airport'

describe Plane do

    it "lands a plane at an airport" do
        airport = Airport.new
        subject.land(airport)
        expect(airport.hanger.last).to eq subject
    end

    it "takes off from an airport" do
        airport = Airport.new
        subject.land(airport)
        subject.takeoff
        expect(airport.hanger.last).to eq nil
    end

    it "can't land if airport is full" do
        airport = Airport.new
        plane = Plane.new
        plane.land(airport)

        expect { subject.land(airport) }.to raise_error "Airport is full"

    end

end