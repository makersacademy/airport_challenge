require "airport"

describe Airport do

  let(:plane) { double("A plane") }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  context "#land" do

    before(:each) do
      subject.land(plane)
    end

    it "lands a plane" do
      expect(subject.hangar).to include plane
    end

  end

  context "#take_off" do

    before(:each) do
      subject.land(plane)
    end

    it "removes plane from the airport after take_off" do
      allow(subject).to receive(:stormy?).and_return false
      subject.take_off(plane)
      expect(subject.hangar).to eq([])
    end

    it "Cannot take_off in stormy weather" do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error("Cannot take off in stormy weather")
    end

  end

end
