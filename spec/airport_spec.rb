require "airport"

describe Airport do

  subject { Airport.new(name) }
  let(:plane) { double :plane }
  let(:name) { "lhr" }

  before { allow(subject).to receive(:stormy?).and_return(false) }

  describe "#takeoff" do

    it "raises an error if the plane is already in air" do
      allow(plane).to receive(:location) { "in air" }
      expect { subject.takeoff(plane) }.to raise_error("Plane is already in air")
    end

    it "raises an error if the plane is not in the airport" do
      jfk = Airport.new("jfk")
      allow(plane).to receive(:location) { jfk }
      expect { subject.takeoff(plane) }.to raise_error("Plane is not in this airport")
    end

    it "raises an error if the weather is stormy" do
      allow(plane).to receive(:location) { subject }
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error("Weather is stormy! Do not takeoff")
    end

    it "deletes the plane from the planes list" do
      allow(plane).to receive(:location) { subject }
      allow(plane).to receive(:change_location).with("in air")
      subject.takeoff(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

  end

  describe "#land" do
    it "raises an error if the plane is already in an airport" do
      allow(plane).to receive(:location) { subject }
      expect { subject.land(plane) }.to raise_error("Plane is already in lhr")
    end

    it "raises an error if there is no space in the Airport" do
      allow(plane).to receive(:location) { "in air" }
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error("No space in airport! Do not land")
    end

    it "appends the plane to the planes list" do
      allow(plane).to receive(:location) { "in air" }
      allow(plane).to receive(:change_location).with(subject)
      subject.land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it "raises an error if the weather is stormy" do
      allow(plane).to receive(:location) { "in air" }
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error("Weather is stormy! Do not land")
    end

  end

end
