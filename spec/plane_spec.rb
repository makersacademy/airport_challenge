require 'plane'

describe Plane do
  let(:paris) { double(:airport, name: "Paris", accept: true, weather_report: "sunny") }
  describe "#location" do
    it "should return 'In the air' if it hasn't landed anywhere" do
      expect(subject.location).to eq Plane::FLYING
    end

    it "should return 'Paris' if it is landed at Paris airport" do
      subject.land_at paris
      expect(subject.location).to eq paris.name
    end
  end

  describe "#land_at" do
    it "should check if the airport can accept it" do
      expect(paris).to receive(:accept).at_least(1).times.with(subject)
      subject.land_at paris
    end

    it "should return true if it succesfully lands" do
      expect(subject.land_at paris).to eq true
    end

    it "should stay in the air if the airport can't accept it" do
      allow(paris).to receive(:accept).and_return(false)
      subject.land_at paris
      expect(subject.location).to eq Plane::FLYING
    end

    it "should return false if it can't land" do
      allow(paris).to receive(:accept).and_return(false)
      expect(subject.land_at paris).to eq false
    end

    it "should raise an error if it is already landed" do
      subject.land_at paris
      expect { subject.land_at paris }.to raise_error InvalidStateError, "Not in the air"
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
      expect(subject.location).to eq Plane::FLYING
    end
    
    it "should return true if it successfully takes off" do
      subject.land_at paris
      expect(subject.take_off).to eq true
    end

    it "should stay on the ground if there's bad weather at the airport" do
      allow(paris).to receive(:weather_report).and_return("stormy")
      subject.land_at paris
      subject.take_off
      expect(subject.location).to eq paris.name
    end

    it "should return false if it doesn't take off" do
      allow(paris).to receive(:weather_report).and_return("stormy")
      subject.land_at paris
      expect(subject.take_off).to eq false
    end
  end
end
