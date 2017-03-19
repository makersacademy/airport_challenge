require "Plane"

describe Plane do
  #Double Syntax
  #broken_bike = double(:bike, working?: false)
  #let (:bike) { double :bike }

  let (:airport) {double :airport}

  describe "#flying?" do

    it "has the method" do
      expect(subject).to respond_to(:flying?)
    end

    it "returns true when new plane initialised" do
      expect(subject.flying?).to eq(true)
    end

    it "can also return false if plane is grounded" do
      airport = double(:airport, land: "Landed Successfully")
      subject.land_at(airport)
      expect(subject.flying?).to eq(false)
    end

  end

  describe "#land_at" do

    it "lands at a specific airport which it receives as an argument" do
      expect(subject).to respond_to(:land_at). with(1).argument
    end

    it "can't land if already grounded" do
      airport = double(:airport, land: "Landed Successfully")
      subject.land_at(airport)
      expect{subject.land_at(airport)}.to raise_error("Plane already grounded")

    end

    it "airport argument must be a valid airport" do

    end

  end

  describe "#takeoff" do
    
    it "makes the plane take-off" do
      airport = double(:airport, land: "Plane already grounded")
      subject.land_at(airport)
      subject.take_off
      expect(subject.flying?).to eq(true)
    end

    it "confirm that plane is in flight" do

    end


  end
end
