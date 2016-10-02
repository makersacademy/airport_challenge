require "plane.rb"
require "airport.rb"

describe Plane do

  let(:airport) do
    airport = Airport.new
  end

  it { is_expected.to respond_to (:flying?) }

  describe "Plane has a default status" do

    it "is flying by default" do
        expect(subject).to be_flying
    end

    it "is not in an airport by default" do
      expect(subject).not_to be_in_airport
    end

  end

  describe "Plane's status changes on taking off or landing'" do

    it "sets flying to true on taking off" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        airport.takeoff(subject)
        expect(subject).to be_flying
    end

    it "sets in_airport to false on taking off" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        airport.takeoff(subject)
        expect(subject).not_to be_in_airport
    end

    it "sets flying to false on landing" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        expect(subject).not_to be_flying
    end

    it "sets in_airport to true on landing" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        expect(subject).to be_in_airport
    end

  end
=begin
  describe "Plane's location'" do

    it "tells you which airport the plane is at" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        expect(subject.check_location).to eq airport
    end

  end
=end
end
