require "airport"

describe Airport do
  let(:plane) {double(:plane)}
  let(:plane2) {double(:plane2)}
  let(:plane3) {double(:plane3)}


  it { expect(subject).to respond_to(:land, :take_off).with(1).argument }
  it { expect(subject).to respond_to(:safe?)}

  it ": should begin empty" do
    expect(subject.planes).to eq []
  end

  describe "#land" do
    it ": confirms plane has landed" do
      allow(subject).to receive(:safe?).and_return(true)
      expect(subject.land(plane)).to eq [plane]
    end

    it "raise error if plane attempts landing when unsafe" do
      allow(subject).to receive(:safe?).and_return(false)
      expect { subject.land(plane)}.to raise_error "It's not safe to land."
    end

    it "should raise error if aiport is full" do
      allow(subject).to receive(:safe?).and_return(true)
      subject.land(plane)
      subject.land(plane2)
      expect { subject.land(plane3)}.to raise_error "Airport is full."
    end

    it "raise error if try to land the same plane" do
      allow(subject).to receive(:safe?).and_return(true)
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error "Plane already landed." if plane == plane
    end

  end

  describe "#take_off" do

    it "raise error if airport is empty" do
      expect { subject.take_off(plane)}.to raise_error "No planes in airport."
    end

    it ": confirm plane is no longer in airport" do
      allow(subject).to receive(:safe?).and_return(true)
      subject.land plane
      subject.take_off plane
      expect(subject.planes).to eq []
    end

    it "raise error if plane attempts take off when it's unsafe" do
      allow(subject).to receive(:safe?).and_return(true)
      subject.land(plane)
      allow(subject).to receive(:safe?).and_return(false)
      expect { subject.take_off(plane)}.to raise_error "Not safe to take off."
    end

    it "raise error if you try to take_off the same plane" do
      allow(subject).to receive(:safe?).and_return(true)
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane2)
      expect{subject.take_off(plane2)}.to raise_error "Plane already taken off." if plane == plane
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

    describe "#capacity" do
    	it "returns DEFAULT_CAPACITY if no capacity is given when initializing" do
    		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "returns given capacity if one is given when initializing" do
        stn = Airport.new 30
        expect(stn.capacity).to eq 30
      end
    end
  end
end
