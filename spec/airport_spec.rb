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
end
