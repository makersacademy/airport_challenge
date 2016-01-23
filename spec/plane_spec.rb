require 'plane'

describe Plane do
  let(:airport) { double :airport}

  describe "#land" do 
    it "responds to land with 1 arg" do 
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it "returns the airport object when landed" do 
      expect(subject.land(airport)).to eq airport
    end

  end

  describe "#landed?" do
    it "returns nil as default value" do
      expect(subject.landed?).to eq nil
    end

    it "returns true after land and landed? are called" do
      subject.land(airport)
      expect(subject.landed?).to eq true
    end
  end

end