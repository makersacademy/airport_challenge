require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do
    it "instructs a plane to land" do
      allow(subject).to receive(:stormy?) { false }
      allow(subject).to receive(:full?) { false }
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "raises an error when airport is full" do
      allow(subject).to receive(:stormy?) { false }
      allow(subject).to receive(:full?) { true }
      expect { subject.land(plane) }.to raise_error("Landing unauthorised: airport full")
    end

    it "raises an error when weather is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error("Landing unathorised: unsafe weather conditions")
    end
  end

  describe '#take_off' do
    it "instruct a plane to take_off" do
      allow(subject).to receive(:stormy?) { false }
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "raises an error when weather is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error("Take-off unathorised: unsafe weather conditions")
    end
  end

end

  # it "confirms landing" do
  #   # allow(subject).to receive(:stormy) { false }
  #   expect(subject.land(plane)).to eq [plane]
  # end

  # it "confirms take-off" do
  #   allow(subject).to receive(:stormy) { false }
  #   expect(subject.take_off(plane)).to eq nil
  # end
