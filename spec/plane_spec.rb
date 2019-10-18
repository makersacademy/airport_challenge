require_relative '../src/Plane'
require_relative '../src/Airport'

describe Plane do
    subject { Plane.new }
    it "should instruct the plane to land at the airport" do
        airport = Airport.new
        subject.Land(airport)
        expect(airport.planes).to include(subject)
    end
end