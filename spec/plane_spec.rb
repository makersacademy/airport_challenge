require 'plane'
require 'airport'

describe Plane do

  describe "#land" do
    it "lands at an airport" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      expect(subject.land(airport)).to eq "Landed at #{airport}!"
    end

    it "raises an error if already landed" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Already landed!"
    end

    it "adds self to airport hangar" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      expect(subject.current_airport.hangar).to include(subject)
    end

    it "raises an error if the weather is too stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 6 }
      expect { subject.land(airport) }.to raise_error "The weather is too stormy!"
    end

    it "knows which airport it's landed at" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      expect(subject.current_airport). to eq airport
    end
  end

  describe "#take_off" do
    it "takes off and confirms" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      expect(subject.take_off).to eq "Taken off!"
    end

    it "fails if already flying" do
      expect { subject.take_off }.to raise_error "Already flying!"
    end

    it "removes self from airport hangar" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      subject.take_off
      expect(airport.hangar).not_to include(subject)
    end

    it "knows that it is flying once taken off" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      subject.take_off
      expect(subject.current_airport). to eq "flying"
    end 

    it "raises an error if the weather is too stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather_setter) { 5 }
      subject.land(airport)
      allow(airport).to receive(:weather_setter) { 6 }
      expect { subject.take_off }.to raise_error "The weather is too stormy!"
    end
  end
end
