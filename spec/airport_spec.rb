require 'Airport'

describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    describe "#land" do

      it "should instruct a plane to land" do
        plane = Plane.new
        subject.land(plane)
        expect(plane.status).to eq("landed")
      end

      it "should store a plane in the airport" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end

    end

    describe "#takeoff" do

      it "should return a specific plane currently in the airport" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.takeoff(plane)).to eq(plane)
      end

      it "should remove the plane from the airport" do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.planes).to eq []
      end

      it "should instruct a plane to fly" do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(plane.status).to eq("airborne")
      end

    end

end
