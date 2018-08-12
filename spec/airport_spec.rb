require "airport"

describe Airport do
  let(:plane) { Plane.new }

  describe "#land" do
    context "during sunny weather" do
      before do
        allow_any_instance_of(Weather).to receive(:report).and_return("sunny")
      end

      it "allows a plane to land" do
        expect(subject).to respond_to(:land).with(1).argument
      end

      it "stores the planes that have landed" do
        subject.land(plane)
        expect(subject.hangar).to include(plane)
      end
    end

    context "during stormy weather" do
      before do
        allow_any_instance_of(Weather).to receive(:report).and_return("stormy")
      end

      it "raises an error" do
        expect { subject.land(plane) }.to raise_error("Too stormy to land!")
      end
    end
  end

  describe "#takeoff" do
    context "during sunny weather" do
      before do
        allow_any_instance_of(Weather).to receive(:report).and_return("sunny")
      end

      it "allows a plane to take off" do
        expect(subject).to respond_to(:takeoff).with(1).argument
      end

      it "returns a message confirming plane has gone when plane takes off" do
        expect(subject.takeoff(plane)).to eq "#{plane} has taken off"
      end

      it "removes a plane that has just taken off from the airport hangar" do
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.hangar).not_to include(plane)
      end
    end

    context "during stormy weather" do
      before do
        allow_any_instance_of(Weather).to receive(:report).and_return("stormy")
      end

      it "raises an error" do
        expect { subject.takeoff(plane) }.to raise_error("Too stormy to take off!")
      end
    end
  end

  describe "#capacity" do
    it "shows the airport capacity" do
      airport = Airport.new
      capacity = Airport::DEFAULT_CAPACITY
      expect(subject.capacity).to eq airport.capacity
    end

    it "allows a user to override the default and set the capacity" do
      new_capacity = 20
      airport = Airport.new(new_capacity)
      expect(airport::capacity).to eq new_capacity
    end
  end

end
