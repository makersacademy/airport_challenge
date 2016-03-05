require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  before { allow(plane).to receive(:land) }
  before { allow(plane).to receive(:take_off) }

  describe "#land" do
    it "lands the plane" do
      subject.land plane
      expect(subject.planes.last).to eq plane
    end
  end

  describe "#take_off" do
    it "plane takes off from the airport" do
      subject.land plane
      subject.take_off plane
      expect(subject.planes).not_to include plane
    end
  end


end
