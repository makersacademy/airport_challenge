require "airport"
require "plane"

describe Airport do

  describe "#airstrip_land" do

    it "allows planes to land" do
      plane = Plane.new
      subject.airstrip_land(plane)
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.hangar).to include(plane)
    end

    it "prevents landing when weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.airstrip_land(plane) }.to raise_error "No planes will land because the weather is stormy"
    end

  end

  describe "#airstrip_take_off" do

    it "allows planes to take off" do
      plane = Plane.new
      subject.hangar << plane
      subject.airstrip_take_off(plane)
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.hangar).to_not include(plane)
    end

    it "prevents taking off when weather is stormy" do
      plane = Plane.new
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

end
