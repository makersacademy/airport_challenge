require 'airport'
require 'plane'

describe "airport-challenge" do

  describe Plane do

  end

  describe Airport do
    it {is_expected.to respond_to (:land)}

    it "should land at the airport" do
      airplane = Plane.new
      airport = Airport.new
      expect(airport.land(airplane)).to eq("The plane has landed.")
    end

    it "should take off" do
      airport = Airport.new
      airplane = Plane.new
      airport.land(airplane)
      expect(airport.take_off).to eq("The plane has taken off.")
    end

  end

end
