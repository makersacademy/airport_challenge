require "airport"

describe Airport do
  let(:plane) {double(:plane)}

  it { expect(subject).to respond_to(:land, :take_off).with(1).argument }

  it ": should begin empty" do
    expect(subject.planes).to eq []
  end

  describe "#land" do
    it "when plane lands, airport should confirm the plane has landed" do
      expect(subject.land plane ).to eq [plane]
    end
  end

  describe "#take_off" do
    it "should raise error if airport is empty" do
      expect { subject.take_off plane }.to raise_error "No planes in airport."
    end
    it "when plane takes_off, airport should confirm plane is no longer in airport" do
      subject.land plane
      subject.take_off plane
      expect(subject.planes).to eq []
    end
  end
end
