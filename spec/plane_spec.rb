require 'plane'

describe Plane do

    it "A plane will respond to the method asking it to land at an airport" do
        plane = Plane.new
        expect(plane).to respond_to :land
    end

    it "A plane will respond to the method asking it to take off from an airport" do
        plane = Plane.new
        expect(plane).to respond_to :take_off
    end

    it "Once a plane has landed, it should no longer be in the air, and once taken off in the air" do
        plane = Plane.new
        plane.land
        expect(plane.in_air).to eq false
        plane.take_off
        expect(plane.in_air).to eq true
    end
end