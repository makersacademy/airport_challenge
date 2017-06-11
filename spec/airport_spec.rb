require 'airport'

describe Airport do
  let(:plane) { double("plane")}

  describe "Initialization" do
    it "Creates a new airport with empty gates" do
      expect(subject).to respond_to :gates
      expect(subject.gates).to be_a Array
    end

    it "Creates local weather" do
      expect(subject).to respond_to :weather
      expect(subject.weather).to be_a Weather
    end
  end

  describe "#instruct" do
    it "responds to instruct" do
      expect(subject).to respond_to(:instruct).with(1).argument
    end

    context "Good Weather" do
      it "instructs a plane to land" do
        allow(plane).to receive(:grounded?).and_return(false)
        allow(plane).to receive(:grounded=)
        allow(subject).to receive(:check_weather) { true }

        subject.instruct({action: "land", plane: plane})
        expect(subject.gates.last).to eq plane
      end

      it "instructs a plane to take off" do
        subject.gates.push(plane)
        allow(plane).to receive(:grounded=)
        allow(plane).to receive(:grounded?).and_return(true)
        allow(subject).to receive(:check_weather) { true }

        subject.instruct({action: "take off", plane: subject.gates.last})
        expect(subject.gates).to_not include(plane)
      end

      it "raises an error if the selected plane isn't at the airport" do
        allow(plane).to receive(:grounded?).and_return(true)
        allow(subject).to receive(:check_weather) { true }

        expect{ subject.instruct({action: "take off", plane: plane}) }.to raise_error(AirportError, "Plane not found")
      end

      it "raises an error if the plane isn't flying when instructed to land" do
        allow(plane).to receive(:grounded?) { true }
        allow(subject).to receive(:check_weather) { true }

        expect{ subject.instruct({action: "land", plane: plane}) }.to raise_error(PlaneError, "Plane not flying")
      end

      it "raises an error if the plane is flying when instructed to take off" do
        allow(plane).to receive(:grounded?) { false }
        allow(subject).to receive(:check_weather) { true }

        expect{ subject.instruct({action: "take off", plane: plane}) }.to raise_error(PlaneError, "Plane already flying")
      end
    end

    context "Bad Weather" do
      it "raises an error when the weather is bad" do
        allow(subject).to receive(:check_weather) { false }
        expect{ subject.instruct({action: "take off", plane: plane}) }.to raise_error(WeatherError, "Inclement weather")
      end
    end
  end

  describe "#report" do
    it "responds to report" do
      expect(subject).to respond_to :report
    end

    it "reports when a plane has landed" do
      expect{ subject.report("land", plane) }.to output("#{plane} has landed successfully.\n").to_stdout
    end

    it "reports when a plane has taken off" do
      expect{ subject.report("take off", plane) }.to output("#{plane} has taken off successfully.\n").to_stdout
    end
  end
end
