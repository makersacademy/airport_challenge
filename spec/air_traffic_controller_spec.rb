require 'air_traffic_controller'
require 'airport'

describe AirTrafficController do

  describe "#name" do
    it "returns the correct name" do
      tc = AirTrafficController.new("Name")
      expect(tc.name).to eq "Name"
    end
  end

  describe "#take_off" do
  end

  describe "#land?" do
    it 'checks the weather at the airport to see if landing is possible' do
      dummy_airport = Airport.new
      dummy_airport.set_weather
      dummy_plane = double(:plane)
      expect(subject.land?(dummy_plane, dummy_airport)).to eq "The conditions are too bad to land"
    end
  end

  describe "#check_planes" do
  end

end
