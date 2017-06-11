require 'Airport'

describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }

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
end
