require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before do
    allow(subject).to receive(:stormy?) { false }
    allow(plane).to receive(:location)
    allow(plane).to receive(:landing)
    allow(plane).to receive(:taking_off)
    allow(plane).to receive(:location) { :up_in_the_air }
    allow(plane).to receive(:name) { :test_plane }
  end

  describe "#land" do
    it "confirms once a plane landed" do
      text = "The #{plane.name} landed succesfully"
      expect { subject.land(plane) }.to output(text).to_stdout
    end

    it "lands a plane and assigns it to the airport" do
      subject.land(plane)
      expect(subject.planes_in_airport).to include plane.name
    end
  end

    describe "#take_off" do
      it "confirms once a plane took off" do
        subject.land(plane)
        allow(plane).to receive(:location) { :airport }
        text = "The #{plane.name} took off succesfully"
        expect { subject.take_off(plane) }.to output(text).to_stdout
      end

      it "takes off planes" do
        allow(subject).to receive(:stormy?) { false }
        expect(subject.planes_in_airport).not_to include plane.name
      end
    end

    describe "#landing_criteria" do
      it "fails when plane is in the airport" do
        subject.land(plane)
        message = "#{plane.name} already landed in this airport"
        expect { subject.land(plane) }.to raise_error message
      end

      it "fails when plane is not in the air" do
        allow(plane).to receive(:location) { :airport }
        message = "#{plane.name} is not in the air"
        expect { subject.land(plane) }.to raise_error message
      end

      it "fails when airport is full" do
        subject.capacity = 1
        subject.land(plane)
        allow(plane).to receive(:name) { :test_plane1 }
        message = "Can't land as the airport is full"
        expect { subject.land(plane) }.to raise_error message
      end

      it "fails when weather is stormy" do
        allow(subject).to receive(:stormy?) { true }
        message = "Can't land due to stormy weather"
        expect { subject.land(plane) }.to raise_error message
      end
    end

    describe "#taking_off_criteria" do
      it "fails when plane is not at that airport" do
        message = "#{plane.name} is not in this aiport"
        expect { subject.take_off(plane) }.to raise_error message
      end

      it "fails when the weather is stormy" do
        subject.land(plane)
        allow(plane).to receive(:location) { subject.name }
        allow(subject).to receive(:stormy?) { true }
        message = "Can't take off due to stormy weather"
        expect { subject.take_off(plane) }.to raise_error message
      end
    end

    describe "#change_capacity" do
      it "changes the capacity of the airport" do
        subject.capacity(5)
        expect(subject.capacity).to eq 5
      end
    end

    describe "#weather_forecast" do
      it "returns a clear weather" do
        allow(subject).to receive(:stormy?) { false }
        expect { subject.weather_forecast }.to output("Clear").to_stdout
      end
      it "returns a stormy weather" do
        allow(subject).to receive(:stormy?) { true }
        expect { subject.weather_forecast }.to output("Stormy").to_stdout
      end
    end
end
