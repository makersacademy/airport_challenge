require "airport"

describe Airport do
  let(:plane) {double(:plane)}

  it { expect(subject).to respond_to(:land).with(1).argument }

  it ": should start empty" do
    expect()
  end
  describe "#land" do
    it "when plane lands, airport should return the plane that landed" do
      expect(subject.land(plane)).to eq plane
    end
  end
end
