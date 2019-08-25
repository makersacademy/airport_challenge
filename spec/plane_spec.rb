require 'plane'

describe Plane do
  let(:airport) { double(:airport, :planes => [], :stormy => false) }

  it "can hold passengers" do
    expect(subject.passengers).to be_instance_of(Array)
  end

  context "when not stormy" do
    it "can land" do
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end

    it "can take_off" do
      allow(airport).to receive(:confirm_departure)
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to_not include(subject)
    end
  end

  context "when stormy" do
    let(:airport) { double(:airport, :planes => [], :stormy => true) }

    it "planes cannot land" do
      subject.land(airport)
      expect(airport.planes).to_not include(subject)
    end

    it "planes cannot take_off" do
      airport.planes << subject
      subject.take_off(airport)
      expect(airport.planes).to include(subject)
    end
  end

  context "edge cases" do
    let(:airport2) { double(:airport, :planes => [], :stormy => false) }

    it "cannot land when already in airport" do
      2.times { subject.land(airport) }
      expect(airport.planes).to eq([subject])
    end

    it "cannot take_off when not landed" do
      expect(subject.take_off(airport)).to eq("#{subject} not at this airport")
    end

    it "cannot take_off from airport it's not in" do
      subject.land(airport2)
      expect(airport2.planes).to include(subject)
      expect(subject.take_off(airport)).to eq("#{subject} not at this airport")
    end

  end
end
