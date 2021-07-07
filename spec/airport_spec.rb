require 'Airport'

describe Airport do
    it "Plane can land at a destination" do
    port = Airport.new
    plane = Plane.new
    expect(port.land(plane)).to eq(true)
    end
end

describe Plane do 
    it "plane can take off from airport and is no longer grounded" do 
        plane = Plane.new
        expect(plane.take_off(plane)).to eq(true)
    end
end

