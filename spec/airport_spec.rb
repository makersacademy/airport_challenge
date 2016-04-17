require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double(:plane) }
  let(:sunny) { allow(subject).to receive(:stormy?).and_return(false) }
  let(:stormy) { allow(subject).to receive(:stormy?).and_return(true) }

  describe "#land" do

    it {expect(subject).to respond_to(:land).with(1).argument}

    it "can't tell a plane to land if it's already in the airport" do
      sunny
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error("Error; Plane ID #{plane} has already landed in Airport ID #{subject}.")
    end

    it "should prevent landing during stormy weather" do
      stormy
      expect{subject.land(plane)}.to raise_error("Can not land during stormy weather.")
    end

    it "should prevent landing when the airport is full" do
      sunny
      allow(subject).to receive(:in_airport?).and_return(false)
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error("Airport is full.")
    end

  end

  describe "#in_airport?" do
    it "should be able to confirm that a plane has landed" do
      sunny
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

  end

  describe "#take_off" do
    it {expect(subject).to respond_to(:take_off).with(1).argument}

    it "should be able to confirm that a plane has taken off" do
      sunny
      plane1 = double(:plane)
      plane2 = double(:plane)
      subject.land(plane1)
      subject.land(plane2)
      subject.take_off(plane1)
      expect(subject.in_airport?(plane1)).to eq false
    end

    it "should prevent take off during stormy weather" do
      sunny
      subject.land(plane)
      stormy
      expect{subject.take_off(plane)}.to raise_error("Can not take off during stormy weather.")
    end

    it "can't tell a plane to take off unless it's already in the airport" do
      sunny
      expect{subject.take_off(plane)}.to raise_error("Error; Plane ID #{plane} is not in Airport ID #{subject}.")
    end

  end

end