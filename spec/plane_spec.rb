require 'plane'

describe Plane do
  let(:weather1) { double :weather, :condition => "sunny"}
  let(:weather2) { double :weather, :condition => "stormy"}
  airport1 = Airport.new
  airport2 = Airport.new

  describe "#land" do 
    it "responds to land with 2 args" do 
      expect(subject).to respond_to(:land).with(2).arguments
    end

    it "returns plane when plane successfully landed" do 
      expect(subject.land(airport1, weather1)).to eq subject
    end

    it "raises an error if already landed" do
      subject.land(airport1, weather1)
      expect {subject.land(airport1, weather1)}.to raise_error("Plane already landed")
    end

    it "prevents landing when weather is stormy" do
      expect {subject.land(airport1, weather2)}.to raise_error("Can't land when weather is stormy")
    end

    it "prevents landing when airport is at capacity" do
      20.times do
        Plane.new.land(airport2, weather1)
      end
      expect {subject.land(airport2, weather1)}.to raise_error("Can't land when airport is at capacity")
    end

    it "prevents landing when weather is bad and airport is full" do
      expect {subject.land(airport2, weather2)}.to raise_error("Can't land when weather is stormy")
    end
  end

  describe "#landed" do
    it "returns nil as default value" do
      expect(subject.landed).to eq nil
    end

    it "returns true after land and landed are called" do
      subject.land(airport1, weather1)
      expect(subject.landed).to eq true
    end

    it "returns false if successfully taken off" do
      subject.land(airport1, weather1)
      subject.takeoff(airport1, weather1)
      expect(subject.landed).to eq false
    end

  end

  describe "#takeoff" do
    it "responds to takeoff with 2 args" do
      expect(subject).to respond_to(:takeoff).with(2).arguments
    end


    it "raises an error if already taken off" do
      subject.land(airport1, weather1)
      subject.takeoff(airport1, weather1)
      expect {subject.takeoff(airport1, weather1)}.to raise_error("Plane already airborne")
    end

    it "raises an error if told to take off from wrong airport" do
      subject.land(airport1, weather1)
      expect {subject.takeoff(airport2, weather1)}.to raise_error("Plane not at this airport")

    end

    it "can't take off if the weather is stormy" do
      subject.land(airport1, weather1)
      expect {subject.takeoff(airport1, weather2)}.to raise_error("Can't take off when weather is stormy")
    end
  end
end