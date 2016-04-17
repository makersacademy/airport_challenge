require "airport"

describe Airport do

  subject(:airport) { described_class.new}
  let(:capacity) {Airport::DEFAULT}
  let(:plane) {Plane.new}
  let(:weather) {Weather.new}

  describe "#initialize" do
    it "airport starts empty" do
      expect(subject.landed_aircraft).to be_empty
    end

    it "sets a default capacity when not passed an argument" do
      expect(subject.capacity).to_not eq nil
    end

    it "can receive a different capacity to the default if wanted." do
      new_airport = Airport.new(50)
      expect(new_airport.capacity).to eq 50
    end

  end

  describe "#arrival" do

    before { allow(airport).to receive(:stormy?) {false} }

    it "expect plane status 'in_airport?' to be true when landed" do
      subject.arrival plane
      expect(plane.in_airport?).to be true
    end

    it "raises error 'Too stormy to land.'" do
      allow(airport).to receive(:stormy?) {true}
      expect{subject.arrival(plane)}.to raise_error ("Too stormy to land.")
    end

    it "raises error 'Airport is full.'." do
      20.times {subject.arrival(Plane.new)}
      expect{subject.arrival(plane)}.to raise_error ("Airport is full.")
    end

    it "aircraft can not land if already in airport" do
      test_plane = Plane.new
      subject.arrival test_plane
      expect{subject.arrival(test_plane)}.to raise_error ("Aircraft already at airport.")
    end

  end

  describe "#departure" do

      before { allow(airport).to receive(:stormy?) {false} }

    it "expect plane status 'in_airport?' to be false when landed" do
      subject.arrival plane
      subject.departure plane
      expect(plane.in_airport?).to be false
    end

    it "raises error 'Too stormy to take-off.'" do
      allow(airport).to receive(:stormy?) {true}
      expect{subject.departure(plane)}.to raise_error ("Too stormy to take-off.")
    end

    it "aircraft can not take-off if not in the airport" do
      test_plane = Plane.new
      subject.arrival test_plane
      subject.departure test_plane
      expect{subject.departure(test_plane)}.to raise_error ("Aircraft not in airport.")
    end

  end

  describe "#full?" do

    it "returns true or false when calling #full." do
      expect(subject.full?).to_not be nil
    end

    it "returns false until capacity is reached" do
      allow(airport).to receive(:stormy?) {false}
      19.times{ subject.arrival(Plane.new) }
      expect(subject.full?).to be false
      subject.arrival plane
      expect(subject.full?).to be true
    end

  end


end
