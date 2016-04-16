require "airport"

describe Airport do

  let(:plane) {Plane.new}

  it { expect(subject).to respond_to(:arrival).with(1).argument }
  it { expect(subject).to respond_to(:departure).with(1).argument }
  it { expect(subject).to respond_to(:stormy?) }

  describe "#initialize" do
    it "airport starts empty" do
      expect(subject.landed_aircraft).to be_empty
    end
  end

  describe "#arrival" do

    it "adds a plane to @landed_aircraft" do
      subject.arrival(plane)
      expect(subject.landed_aircraft).to include plane
    end

    it "@landed_aircraft increases by one when a plane lands" do
      subject.arrival(plane)
      expect(subject.landed_aircraft.count).to eq 1
    end

    it "expect plane status 'in_airport?' to be true when landed" do
      subject.arrival(plane)
      expect(plane.in_airport?).to be true
    end

  end

  describe "#departure" do
    it "removes aircraft from '@landed_aircraft' " do
      subject.arrival(plane)
      subject.departure(plane)
      expect(subject.landed_aircraft).to_not include plane
    end

    it "@landed_aircraft decreases by one when a plane lands" do
      subject.arrival(plane)
      subject.departure(plane)
      expect(subject.landed_aircraft.count).to eq 0
    end

    it "expect plane status 'in_airport?' to be false when landed" do
      subject.arrival(plane)
      subject.departure(plane)
      expect(plane.in_airport?).to be false
    end
  end

end
