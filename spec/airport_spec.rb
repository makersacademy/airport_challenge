require_relative '../src/Plane'
require_relative '../src/Airport'

describe Airport do
    subject { Airport.new(1) }

    it "should allow the user to set an airport size" do
        plane = Plane.new
        plane.Land(subject)
        plane2 = Plane.new
        expect(plane2.Land(subject)).to eq('Airport is full')
    end
end