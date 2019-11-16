require 'plane'

describe Plane do
  let(:paris) { double(:airport, name: "Paris", accept: true, take_off_slot: true) }
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

    def bad_weather_at airport
      allow(airport).to receive(:accept).and_return(false)
    end

    it "should stay in the air if the airport can't accept it" do
      bad_weather_at paris
      subject.land_at paris
      expect(subject.location).to eq Plane::FLYING
    end

    it "should return false if it can't land" do
      bad_weather_at paris
      expect(subject.land_at paris).to eq false
    end

    it "should raise an error if it is already landed" do
      subject.land_at paris
      expect { subject.land_at paris }.to raise_error InvalidStateError, "Not in the air"
    end
  end

  describe "#take_off" do
    before(:each) { subject.land_at paris }
    it "should raise an error if the plane hasn't landed yet" do
      expect { Plane.new.take_off }
        .to raise_error InvalidStateError, "Can't take off in the air"
    end

    it "should ask the airport if there is a slot for it to take off" do
      expect(paris).to receive(:take_off_slot).at_least(1).times.with(subject)
      subject.take_off
    end

    it "should put the plane in the air if landed" do
      subject.take_off
      expect(subject.location).to eq Plane::FLYING
    end
    
    it "should return true if it successfully takes off" do
      expect(subject.take_off).to eq true
    end

    def bad_weather_at airport
      allow(airport).to receive(:take_off_slot).and_return(false)
    end

    it "should stay on the ground if there's bad weather at the airport" do
      bad_weather_at paris
      subject.take_off
      expect(subject.location).to eq paris.name
    end

    it "should return false if it doesn't take off" do
      bad_weather_at paris
      expect(subject.take_off).to eq false
    end
  end
end
