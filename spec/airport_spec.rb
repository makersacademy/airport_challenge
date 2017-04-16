require 'airport'

describe Airport do
  subject (:airport) { described_class.new }
  plane = "test_plane"
  describe "#land" do
    it "should print a confirmation once a plane landed" do
      allow(airport).to receive(:stormy?) { false }
      expect { subject.land(plane) }.to output("The plane landed succesfully").to_stdout
    end
    it "should be able to land a plane" do
      allow(airport).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.planes_in_airport.include? plane).to be true
    end
    it "should fail when the weather is stormy" do
      allow(airport).to receive(:stormy?) { true }
      expect{ subject.land(plane) }.to raise_error "Can't land due to stormy weather"
    end
  end
  describe "#take_off" do
    it "should be able to take off planes" do
      allow(airport).to receive(:stormy?) { false }
      expect { subject.take_off(plane) }.to output("The plane took off succesfully").to_stdout
    end
    it "should be able to take off planes" do
      allow(airport).to receive(:stormy?) { false }
      expect(subject.planes_in_airport.include? plane).to be false
    end
    it "should fail when the weather is stormy?" do
      allow(airport).to receive(:stormy?) { true }
      expect{ subject.take_off(plane) }.to raise_error "Can't take off due to stormy weather"
    end
  end
end
