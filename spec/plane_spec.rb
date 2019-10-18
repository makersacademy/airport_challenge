require_relative '../src/Plane'
require_relative '../src/Airport'

describe Plane do
    subject { Plane.new }
    it "should instruct the plane to land at the airport" do
        airport = Airport.new
        subject.Land(airport, "Sunny")
        expect(airport.planes).to include(subject)
    end

    it "should instruct the plane to take off" do
        airport = Airport.new
        subject.Land(airport, "Sunny")
        subject.TakeOff(airport, "Sunny")
        expect(subject.isFlying).to eq(true)
    end

    it "should not allow the plane to land if weather is stormy" do
        airport = Airport.new
        subject.Land(airport, "Stormy")
        expect(subject.isFlying).to eq(true)
    end
end