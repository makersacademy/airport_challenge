require 'plane'

describe Plane do
  context "When using the Plane class" do
    it "should tell us which airport it is landing in" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.receive(subject)
      expect(subject.airport).to eq(airport.airport_id)
    end

    it "should tell us if the plane is flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.receive(subject)
      airport.allow_take_off(subject)
      expect(subject.flying?).to eq(true)
    end

    it "should not be assigned to an airport while flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.receive(subject)
      airport.allow_take_off(subject)
      expect(airport.in_airport?(subject)).to be(false)
      expect(subject.airport).to eq("")
    end

    it "should be able to change the flight status" do
      subject.change_status("Heathrow", true)
      expect(subject.flying).to eq(true)
      expect(subject.airport).to eq("Heathrow")
    end

  end

end
