require 'plane'

describe Plane do
  let(:airport) { double(:airport, :planes => []) }

  it "can hold passengers" do
    expect(subject.passengers).to be_instance_of(Array)
  end

  it "can land" do
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  describe ".take_off" do
    it "can take_off" do
      airport.planes << subject
      subject.take_off(airport)
      expect(airport.planes).to_not include(subject)
    end

    it "confirms departure" do
      airport.planes << subject
      expect(subject.take_off(airport)).to eq("#{subject} has successfully departed")
    end
  end
end
