require 'Airport'

describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    describe "#capacity" do
      it "allows the capacity to be set" do
        airport = Airport.new(40)
        expect(airport.capacity).to eq(40)
      end

      it "should return the default capacity when it is not specified" do
        airport = Airport.new
        expect(airport.capacity).to eq(20)
      end
    end

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

      context "when airport is full" do

        it "should raise an error" do
          plane = Plane.new
          Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
          expect{subject.land(plane)}.to raise_error("Airport is full")
        end

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

      context "when plane is not stored in airport" do

        it "should raise an error" do
          plane = Plane.new
          expect{subject.takeoff(plane)}.to raise_error("This plane is not here")
        end

      end

    end

    describe "#stormy?" do
      it "should be true if weather is stormy" do
        allow_any_instance_of(Weather).to receive(:forecast).and_return("stormy")
        expect(subject.stormy?).to eq(true)
      end
    end

end
