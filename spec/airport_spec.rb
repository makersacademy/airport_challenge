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

end