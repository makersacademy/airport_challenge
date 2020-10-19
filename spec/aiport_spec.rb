require "./lib/airport"

RSpec.describe Airport do
  subject { Airport.new(capacity) }
  let(:capacity) { 1 }

  describe "#land" do
    it "(a plane) lands on the airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      is_expected.to respond_to(:land)
    end

    it "throws an error if airport is full" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land
      expect { subject.land }.to raise_error(RuntimeError, "Error: Airport full")
    end
  end

  describe "#take_off" do
    it "(a plane) should land on the airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      is_expected.to respond_to(:take_off)
    end

    it "a plane is no longer at the airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land
      expect(subject.plane_count). to eq 1
      subject.take_off
      expect(subject.plane_count). to eq 0
    end
  end

  describe "#capacity" do
    let(:capacity) { 2 }
    it "airport can have capacity changed" do
      expect(subject.capacity). to eq 2
    end
  end

  describe "#stormy?" do
    it "checks if it's is_stormy" do
      is_expected.to respond_to :stormy?
    end

    it "throws error if_stormy and land" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land }.to raise_error(RuntimeError, "Cannot land, it's stormy")
    end
  end
end
