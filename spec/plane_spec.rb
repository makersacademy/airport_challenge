require 'plane'
require 'airport'

describe Plane do

  describe "#land" do
    it "lands at an airport" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) { 5 }
      expect(subject.land(airport)).to eq "Landed!"
    end

    it "raises an error if the weather is too stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) {6}
      expect { subject.land(airport) }.to raise_error "The weather is too stormy!"
    end

    it "knows which airport it's landed at" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) { 5 }
      subject.land(airport)
      expect(subject.current_airport). to eq airport
    end
  end

  describe "#take_off" do
    it "takes off and confirms" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) { 5 }
      subject.land(airport)
      expect(subject.take_off).to eq "Taken off!"
    end

    it "knows that it is flying once taken off" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) { 5 }
      subject.land(airport)
      subject.take_off
      expect(subject.current_airport). to eq "flying"
    end 

    it "raises an error if the weather is too stormy" do
      airport = Airport.new
      allow(airport).to receive(:weather_check) { 5 }
      subject.land(airport)
      allow(airport).to receive(:weather_check) { 6 }
      expect { subject.take_off }.to raise_error "The weather is too stormy!"
    end
  end
end
