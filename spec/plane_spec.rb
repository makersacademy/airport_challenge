require 'plane'

describe Plane do
  let(:airport) { double :airport }
  let(:airport2) { double :airport }
  let(:weather) { double :weather, :current => "sunny"}
  let(:weather2) { double :weather, :current => "stormy"}

  describe "#land" do 
    it "responds to land with 1 arg" do 
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it "returns the airport object when landed" do 
      expect(subject.land(airport)).to eq airport
    end

    it "raises an error if already landed" do
      subject.land(airport)
      expect {subject.land(airport)}.to raise_error("error: plane already landed")
    end
  end

  describe "#landed" do
    it "returns nil as default value" do
      expect(subject.landed).to eq nil
    end

    it "returns true after land and landed? are called" do
      subject.land(airport)
      expect(subject.landed).to eq true
    end

    it "returns false if successfully taken off" do
      subject.land(airport)
      subject.takeoff(airport, weather)
      expect(subject.landed).to eq false
    end

  end

  describe "#takeoff" do
    it "responds to takeoff with 2 args" do
      expect(subject).to respond_to(:takeoff).with(2).arguments
    end


    it "raises an error if already taken off" do
      subject.land(airport)
      subject.takeoff(airport, weather)
      expect {subject.takeoff(airport, weather)}.to raise_error("error: already taken off")
    end

    it "raises an error if told to take off from wrong airport" do
      subject.land(airport)
      expect {subject.takeoff(airport2, weather)}.to raise_error("error: cannot take off from a different airport")

    end

    it "can't take off if the weather is stormy" do
      subject.land(airport)
      expect {subject.takeoff(airport, weather2)}.to raise_error("error: cannot take off when weather is stormy")
    end
  end
end