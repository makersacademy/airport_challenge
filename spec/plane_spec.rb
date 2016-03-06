require 'plane'

describe Plane do
  let(:dummy_airport) {double :airport}

  describe "landing sequence: " do

    it "can be instructed to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "can be verified as landed" do
      subject.land(dummy_airport)
      expect(subject.airborne?).to eq false
    end

  end

  describe "takeoff sequence:" do

    it "can be instructed to take off" do
      expect(subject).to respond_to(:takeoff)
    end

    it "can be verified as...taken off?" do
      subject = Plane.new(dummy_airport)
      subject.takeoff
      expect(subject.airborne?).to eq true
    end

  end

  describe "status consistency:" do

    it "is in a airport when landed" do
      subject = Plane.new(dummy_airport)
      expect(subject.stationed_at?).to eq dummy_airport
    end

    it "raises an exception if told to takeoff while in flight" do
      expect{subject.takeoff}.to raise_error('Warning! Already in flight.')
    end

    it "raises an exception if told to land while on the ground" do
      subject = Plane.new(dummy_airport)
      expect{subject.land(dummy_airport)}.to raise_error('Warning! Already landed.')
    end

  end

end
