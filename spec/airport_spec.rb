require './lib/airport'
describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe "#land" do
    it "will raise an error if the runway is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error("Error, runway is full")
    end
  end

  describe "#take_off" do
    let(:plane) { double :plane }
    it "allows planes to take off" do
      allow(plane).to receive(:taken_off?).and_return(true)
      allow(plane).to receive(:landed?).and_return(false)
      subject = Airport.new
      subject.land(plane)
      plane_left = subject.take_off
      expect(plane_left).to be_taken_off
    end

    it "will raise an error if there are no planes o take off" do
      expect { subject.take_off }.to raise_error "There are no planes to take off"
    end
  end
end
