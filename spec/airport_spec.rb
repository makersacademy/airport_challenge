require './lib/airport'
require './lib/weather'
describe Airport do
  let(:plane) { double :plane }
  let(:airport) { Airport.new }
  let(:weather) { double :weather }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe "#land" do
    it "will raise an error if the runway is full" do
      allow(subject).to receive(:stormy).and_return "clear"
      Airport::DEFAULT_CAPACITY.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error "Error, runway is full"
    end

    it "will raise an error if planes are unable to land due to weather" do
      allow(subject).to receive(:stormy).and_return "stormy"
      expect { subject.land(plane) }.to raise_error "Stormy weather, unable to land in these conditions."
    end
  end

  describe "#take_off" do
    it "allows planes to take off" do
      allow(plane).to receive(:taken_off?).and_return(true)
      allow(plane).to receive(:landed?).and_return(false)
      allow(airport).to receive(:stormy).and_return "clear"
      allow(plane).to receive(:stormy).and_return "clear"
      subject.land(plane)
      plane_left = subject.take_off
      expect(plane_left).to be_taken_off
    end

    it "will raise an error if there are no planes to take off" do
      expect { subject.take_off }.to raise_error "There are no planes to take off"
    end
  end
end
