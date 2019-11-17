require 'plane'

describe Plane do

  let(:fair_weather) { double(:fair_weather, stormy?: false) }
  let(:stormy_weather) { double(:stormy_weather, stormy?: true) }

  describe "initialize" do 
    let(:airport_name) { double(:airport_name) }
    it "should have a location when first inititalsed" do
      plane1 = Plane.new(airport_name)
      expect(plane1.location).to eq(airport_name)
    end

    it "should update the location of the plane when landing at a new airport" do

    end
  end

  # describe "#in_flight?" do

  #   it "should change to true when taking off from an airport" do
  #     airport = Airport.new
  #     plane1 = Plane.new(airport)
  #     airport.take_off(plane1, fair_weather)
  #     expect(plane1).to be_in_flight
  #   end
  # end


end
