require "airport"

describe Airport do
  let(:plane) {double(:plane)}

  it { expect(subject).to respond_to(:land, :take_off).with(1).argument }
  it { expect(subject).to respond_to(:safe?)}

  it ": should begin empty" do
    expect(subject.planes).to eq []
  end

  describe "#land" do
    it "when plane lands, airport should confirm the plane has landed" do
      expect(subject.land(plane)).to eq [plane]
    end

    it "should raise error if plane tries to take off when it's unsafe" do
      allow(subject).to receive(:safe?).and_return(false)
      expect { subject.land(plane)}.to raise_error "It's not safe to land." if subject.safe? == false
    end
  end

  describe "#take_off" do

    it "should raise error if airport is empty" do
      expect { subject.take_off(plane)}.to raise_error "No planes in airport."
    end

    it "when plane takes_off, airport should confirm plane is no longer in airport" do
      subject.land plane
      subject.take_off plane
      expect(subject.planes).to eq []
    end

    it "should raise error if plane tries to take off when it's unsafe" do
      subject.land(plane)
      allow(subject).to receive(:safe?).and_return(false)
      expect { subject.take_off(plane)}.to raise_error "It's not safe to take off." if subject.safe? == false
    end

    describe "#safe?" do

      it "should return false if weather is stormy" do
        allow(subject).to receive(:safe?).and_return(false)
        expect(subject.safe?).to eq false
      end

      it "should return true if weather is sunny" do
        allow(subject).to receive(:safe?).and_return(true)
        expect(subject.safe?).to eq true
      end
    end
  end
end
