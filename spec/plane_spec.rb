require 'plane'

describe Plane do
  let(:paris) { double(:airport, name: "Paris") }
  describe "#location" do
    it "should return 'In the air' if it hasn't landed anywhere" do
      expect(subject.location).to eq Plane::FLYING_STRING
    end

    it "should return 'Paris' if it is landed at Paris airport" do
      subject.land_at paris
      expect(subject.location).to eq paris.name
    end
  end

  describe "#take_off" do
    it "should raise an error if the plane hasn't landed yet" do
      expect { subject.take_off }
        .to raise_error InvalidStateError, "Can't take off in the air"
    end

    it "should put the plane in the air if landed" do
      subject.land_at paris
      subject.take_off
      expect(subject.location).to eq Plane::FLYING_STRING
    end
  end
end
