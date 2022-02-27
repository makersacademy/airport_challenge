require './lib/plane'

describe Plane do
  
  let(:airport) { double("airport", :hangar => []) }
  let(:another_airport) { double("another airport", :hangar => []) }
  let(:weather) { double("weather") }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:flying?) }
  it { is_expected.to respond_to(:check_weather) }

  describe "#land" do
    it "lands the plane when sunny" do
      allow(subject).to receive(:check_weather) { "Sunny" }
      allow(airport).to receive(:full?).and_return(false)
      subject.land(airport)
      expect(subject.flying?).to eq false
    end

    it "does not land the plane when the weather is stormy" do
      allow(subject).to receive(:check_weather) { "Stormy" }
      allow(airport).to receive(:full?).and_return(false)
      expect { subject.land(airport) }.to raise_error("Unable to land due to the weather")
    end

    it "does not land the plane when the airport is full" do
      allow(subject).to receive(:check_weather) { "Sunny" }
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.land(airport) }.to raise_error("Airport is full")
    end

    it "does not land the plane again if the plane has already landed" do
      allow(subject).to receive(:check_weather) { "Sunny" }
      allow(airport).to receive(:full?).and_return(false)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("This plane is already at an airport")
    end
  end

  describe "#take_off" do
    it "takes off when the weather is sunny" do
      allow(subject).to receive(:check_weather) { "Sunny" }
      allow(airport).to receive(:full?).and_return(false)
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.flying?).to eq true
    end

    it "does not take off when the weather is stormy" do
      allow(subject).to receive(:check_weather) { "Sunny" }
      allow(airport).to receive(:full?).and_return(false)
      subject.land(airport)
      allow(subject).to receive(:check_weather) { "Stormy" }
      expect { subject.take_off(airport) }.to raise_error("Unable to take off due to the weather")
    end

    it "does not take off if the plane is at a different airport" do
      allow(subject).to receive(:check_weather) { "Sunny" }
      allow(airport).to receive(:full?).and_return(false)
      subject.land(airport)
      expect { subject.take_off(another_airport) }.to raise_error("This plane is not at this airport")
    end

    it "does not take off when the plane is flying" do
      expect { subject.take_off(airport) }.to raise_error("This plane is not at an airport")
    end
  end

  describe "#check_weather" do
    it "returns either Sunny or Stormy" do
      expect(subject.check_weather).to eq("Sunny").or eq("Stormy")
    end
  end
end
