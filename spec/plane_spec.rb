require 'plane'

describe Plane do
  let(:airport) { double :airport }
  let(:airport2) { double :airport }

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
      subject.takeoff(airport)
      expect(subject.landed).to eq false
    end

  end

  describe "#takeoff" do
    it "responds to takeoff with 1 arg" do
      expect(subject).to respond_to(:takeoff).with(1).arguments
    end

    it "takes off from the airport that it is landed at" do
      subject.land(airport)
      expect(subject.takeoff(airport)).to eq airport
      end

    it "raises an error if already taken off" do
      subject.land(airport)
      subject.takeoff(airport)
      expect {subject.takeoff(airport)}.to raise_error("error: already taken off")
    end

    it "raises an error if told to take off from wrong airport" do
      subject.land(airport)
      expect {subject.takeoff(airport2)}.to raise_error("error: cannot take off from a different airport")

    end
  end
end