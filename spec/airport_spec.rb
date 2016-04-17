require "airport"

describe Airport do

  subject(:airport) { described_class.new}
  let(:capacity) {Airport::DEFAULT}
  let(:plane) {Plane.new}

  it { expect(subject).to respond_to(:arrival).with(1).argument }
  it { expect(subject).to respond_to(:departure).with(1).argument }
  it { expect(subject).to respond_to(:stormy?)}
  it { expect(subject).to respond_to(:full?)}

  describe "#initialize" do
    it "airport starts empty" do
      expect(subject.landed_aircraft).to be_empty
    end

    it "sets a default capacity when not passed an argument" do
      new_airport = Airport.new
      expect(subject.capacity).to_not eq nil
    end

    it "can receive a different capacity to the default if wanted." do
      new_airport = Airport.new(50)
      expect(new_airport.capacity).to eq 50
    end

  end

  describe "#arrival" do

    it "adds a plane to @landed_aircraft" do
      allow(airport).to receive(:stormy?) {false}
      subject.arrival(plane)
      expect(subject.landed_aircraft).to include plane
    end

    it "@landed_aircraft increases by one when a plane lands" do
      allow(airport).to receive(:stormy?) {false}
      subject.arrival(plane)
      expect(subject.landed_aircraft.count).to eq 1
    end

    it "expect plane status 'in_airport?' to be true when landed" do
      allow(airport).to receive(:stormy?) {false}
      subject.arrival(plane)
      expect(plane.in_airport?).to be true
    end

    it "raises error 'Too stormy to land.'" do
      allow(airport).to receive(:stormy?) {true}
      expect{subject.arrival(plane)}.to raise_error ("Too stormy to land.")
    end

    it "raises error 'Airport is full.'." do
      allow(airport).to receive(:stormy?) {false}
      20.times {subject.arrival(plane)}
      expect{subject.arrival(plane)}.to raise_error ("Airport is full.")
    end

  end

  describe "#departure" do
    it "removes aircraft from '@landed_aircraft' " do
      allow(airport).to receive(:stormy?) {false}
      subject.arrival(plane)
      subject.departure(plane)
      expect(subject.landed_aircraft).to_not include plane
    end

    it "@landed_aircraft decreases by one when a plane lands" do
      allow(airport).to receive(:stormy?) {false}
      subject.arrival(plane)
      subject.departure(plane)
      expect(subject.landed_aircraft.count).to eq 0
    end

    it "expect plane status 'in_airport?' to be false when landed" do
      allow(airport).to receive(:stormy?) {false}
      subject.arrival(plane)
      subject.departure(plane)
      expect(plane.in_airport?).to be false
    end

    it "raises error 'Too stormy to take-off.'" do
      allow(airport).to receive(:stormy?) {true}
      expect{subject.departure(plane)}.to raise_error ("Too stormy to take-off.")
    end
  end

  describe "#stormy?" do
    it "returns false when weather isnt stormy" do
      allow(airport).to receive(:stormy?) {false}
      expect(subject.stormy?).to be false
    end

    it "returns true when weather is stormy" do
      allow(airport).to receive(:stormy?) {true}
      expect(subject.stormy?).to be true
    end
  end

  describe "#full?" do

    it "returns true or false when calling #full." do
      expect(subject.full?).to_not be nil
    end

    it "returns false until capacity is reached" do
      allow(airport).to receive(:stormy?) {false}
      19.times{ subject.arrival(plane) }
      expect(subject.full?).to be false
      subject.arrival(plane)
      expect(subject.full?).to be true
    end


  end


end
