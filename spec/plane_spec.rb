require 'plane'

describe Plane do
  let(:airport){double :airport, :planes => [], :full? => false}
  let(:airport_full){double :airport, :planes => [subject], :full? => true}
  it "should initialize with a 'flying' attribute" do
    expect(subject.flying).to eq false
  end

  describe "land" do
    it "should change 'flying' to false" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(airport)
      expect(subject.flying).to eq false
    end
    it "should add plane into airport array" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(airport)
      expect(airport.planes).to eq [subject]
    end

    it "should raise an error if weather is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect {subject.land(airport)}.to raise_error("Landing prevented by weather")
    end

    it "should raise an error if airport is full" do
      allow(subject).to receive(:stormy?) { false }
      expect {subject.land(airport_full)}.to raise_error("Airport at capacity, landing prevented")
    end

  end

  describe "take_off" do
    it "should change 'flying' to true" do
      allow(subject).to receive(:stormy?) { false }
      subject.take_off(airport)
      expect(subject.flying).to eq true
    end

    it "should remove plane from airport array" do
      allow(subject).to receive(:stormy?) { false }
      subject.take_off(airport_full)
      expect(airport_full.planes).to eq []
    end

    it "should raise an error if weather is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect {subject.take_off(airport_full)}.to raise_error("Take off prevented by weather")
    end

  end


end
