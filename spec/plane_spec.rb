require_relative '../src/Plane'
require_relative '../src/Airport'

describe Plane do
    subject { Plane.new }

    it "should instruct the plane to land at the airport" do
        airport = Airport.new(5)
        subject.Land(airport)
        expect(airport.planes).to include(subject)
    end
    it "should instruct the plane to take off" do
        airport = Airport.new(5)
        subject.Land(airport)
        subject.TakeOff(airport)
        expect(subject.isFlying).to eq(true)
    end
    it "should not allow the plane to land if weather is stormy" do
        airport = Airport.new(5)
        airport.weather = "Stormy"
        subject.Land(airport)
        expect(subject.isFlying).to eq(true)
    end
    it "should not allow the plane to take off if weather is stormy" do
        airport = Airport.new(5)
        subject.Land(airport)
        airport.weather = "Stormy"
        subject.TakeOff(airport)
        expect(subject.isFlying).to eq(false)
    end
    it "should not allow the plane to land if the airport is full" do
        airport = Airport.new(1)
        subject.Land(airport)
        newPlane = Plane.new
        expect(newPlane.Land(airport)).to eq('Airport is full')
    end
end