require "airport"


describe Airport do
  let(:weather) { double :weather }
  subject(:airport) { described_class.new(weather) }
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
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land plane
      subject.take_off plane
      expect(subject.planes).not_to include plane
    end

    it "take-off is prevented when weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off plane }.to raise_error "Take-off prevented due to stormy weather"
    end

    it "allows take-off when weather is clear" do
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.take_off plane }.not_to raise_error
    end
  end


end
