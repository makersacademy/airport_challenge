require "airport"
require "plane"

describe Airport do

let(:plane) { double("plane") }

  describe "#airstrip_land" do

    it "allows planes to land" do
      allow(subject).to receive(:stormy?).and_return false
      subject.airstrip_land(plane)
      expect(subject.hangar).to include(plane)
    end

    it "prevents landing when weather is stormy" do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.airstrip_land(plane) }.to raise_error "No planes will land because the weather is stormy"
    end

    it "prevents landing when hangar is full" do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:full?).and_return true
      expect { subject.airstrip_land(plane) }.to raise_error "No planes will land because the hangar is full"
    end

  end

  describe "#airstrip_take_off" do

    it "allows planes to take off" do
      subject.hangar << plane
      allow(subject).to receive(:stormy?).and_return false
      subject.airstrip_take_off(plane)
      expect(subject.hangar).to_not include(plane)
    end

    it "prevents taking off when weather is stormy" do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.airstrip_take_off(plane) }.to raise_error "No planes will take off because of the stormy weather"
    end

  end

  describe "#stormy?" do
    it "checks if the weather is stormy" do
      allow(subject).to receive(:weather).and_return("stormy")
      expect(subject.stormy?).to eq true
    end
  end

  describe "#full?" do
    it "checks if the hangar is full" do
      Airport::DEFAULT_CAPACITY.times { subject.hangar << Plane.new }
      expect(subject.full?).to eq true
    end
  end

end
