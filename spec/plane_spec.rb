require 'plane'

describe Plane do
  context "When using the Plane class" do
    it "should tell us which aiport it is landing in" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(subject)
      expect(subject.current_airport).to eq(airport.airport_id)
    end

    it "should tell us if the plane is flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying?).to eq(true)
    end

    it "should not be assigned to an airport while flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(subject)
      airport.take_off(subject)
      expect(airport.in_airport?(subject)).to be(false)
      expect(subject.current_airport).to eq("")
    end
  end

end
