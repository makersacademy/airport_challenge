require 'airport'

describe Airport do
  let(:plane) { double("plane") }
  let(:plane_2) { double("plane_2") }

  describe "Initialization" do
    it "Creates a new airport with the default number of empty gates" do
      expect(subject).to respond_to :gates
      expect(subject.gates).to be_a Array

      expect(subject).to respond_to :capacity
      expect(subject.capacity).to eq 20
    end

    it "creates a new airport with a custom number of gates" do
      test_airport = Airport.new({ capacity: 100 })
      expect(test_airport.capacity).to eq 100
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

        subject.instruct({ action: "land", plane: plane })
        expect(subject.gates.last).to eq plane
      end

      it "instructs a plane to take off" do
        subject.gates.push(plane)
        allow(plane).to receive(:grounded=)
        allow(plane).to receive(:grounded?).and_return(true)
        allow(subject).to receive(:check_weather) { true }

        subject.instruct({ action: "take off", plane: subject.gates.last })
        expect(subject.gates).to_not include(plane)
      end

      it "raises an error if the selected plane isn't at the airport" do
        allow(plane).to receive(:grounded?).and_return(true)
        allow(subject).to receive(:check_weather) { true }

        expect { subject.instruct({ action: "take off", plane: plane }) }.to raise_error(AirportError, "Plane not found")
      end

      it "raises an error if the plane isn't flying when instructed to land" do
        allow(plane).to receive(:grounded?) { true }
        allow(subject).to receive(:check_weather) { true }

        expect { subject.instruct({ action: "land", plane: plane }) }.to raise_error(PlaneError, "Plane not flying")
      end

      it "raises an error if the airport is full" do
        test_airport = Airport.new({ capacity: 1 })
        allow(test_airport).to receive(:check_weather) { true }

        allow(plane).to receive(:grounded?) { false }
        allow(plane).to receive(:grounded=)

        allow(plane_2).to receive(:grounded?) { false }
        allow(plane_2).to receive(:grounded=)
        test_airport.instruct({ action: "land", plane: plane })

        expect { test_airport.instruct({ action: "land", plane: plane_2 }) }.to raise_error(AirportError, "Airport is full")
      end

      it "raises an error if the plane is flying when instructed to take off" do
        allow(plane).to receive(:grounded?) { false }
        allow(subject).to receive(:check_weather) { true }

        expect { subject.instruct({ action: "take off", plane: plane }) }.to raise_error(PlaneError, "Plane already flying")
      end
    end

    context "Bad Weather" do
      it "raises an error when the weather is bad" do
        allow(subject).to receive(:check_weather) { false }
        expect { subject.instruct({ action: "take off", plane: plane }) }.to raise_error(WeatherError, "Inclement weather")
      end
    end
  end

  describe "#report" do
    it "responds to report" do
      expect(subject).to respond_to :report
    end

    it "reports when a plane has landed" do
      expect { subject.report("land", plane) }.to output("#{plane} has landed successfully.\n").to_stdout
    end

    it "reports when a plane has taken off" do
      expect { subject.report("take off", plane) }.to output("#{plane} has taken off successfully.\n").to_stdout
    end
  end
end
