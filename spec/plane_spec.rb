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

    it "knows its default 'location' is flying" do
      expect(subject.get_location).to eq "Plane is flying"
    end

  end

  describe "Plane's status changes on taking off or landing'" do

    it "sets flying to true on taking off" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        airport.takeoff(subject)
        expect(subject).to be_flying
    end

    it "sets flying to false on landing" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        expect(subject).not_to be_flying
    end

  end

  describe "Plane's location'" do

    it "having landed, knows which airport it's in" do
        allow(airport).to receive(:weather) { "sunny" }
        airport.land(subject)
        expect(subject.get_location).to eq "Plane is at airport #{airport.airport_id}"
    end

  end

end
