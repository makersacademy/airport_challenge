require 'plane'

describe Plane do
  context "When using the Plane class" do
    it "should tell us which aiport it is landing in" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.current_airport).to eq(airport.object_id)
    end

    it "should tell us if the plane is flying" do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying?).to eq(true)
    end

    it "should not be able to take off when already airbourne" do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect{airport.take_off(subject)}.to raise_error "This plane is already flying"
    end

    it "should not be assigned to an airport while flying" do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.current_airport).to eq("")
      expect(airport.in_airport?(subject)).to be(false)
    end
  end

end
