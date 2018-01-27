require "airport"

describe Airport do

  let(:plane) { double("A plane") }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  context "#land" do
    it "lands a plane" do
      expect(subject.land(plane)).to eq(plane)
    end
  end

  context "#take_off" do
    it "removes plane from the airport after take_off" do
      subject.land(plane)
      expect(subject.take_off).to eq(nil)
    end
  end

end
