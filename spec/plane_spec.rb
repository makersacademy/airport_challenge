require "plane"

describe Plane do
    
    it "should be able to land" do
        expect(subject).to respond_to(:land)
    end

    it "should be able to take off" do
        expect(subject).to respond_to(:take_off)
    end

    it "should not be in flight after landing" do
        plane = Plane.new
        plane.take_off
        plane.land
        expect(plane.in_flight?).to eq false
    end

    it "should be in flight after take off" do
        plane = Plane.new
        plane.take_off
        expect(plane.in_flight?).to eq true
    end

    it "should not be able to land more than once" do
        plane = Plane.new
        expect { plane.land }.to raise_error "Plane already landed"
    end

    it "should not be able to take off more than once" do
        plane = Plane.new
        plane.take_off
        expect { plane.take_off }.to raise_error "Plane already departed"
    end

end