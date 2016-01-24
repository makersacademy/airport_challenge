require 'air_traffic_controller'
require 'airport'

describe AirTrafficController do

  describe "#name" do
    it "returns the correct name" do
      tc = AirTrafficController.new("Name")
      expect(tc.name).to eq "Name"
    end
  end

  describe "#land?" do
    it 'checks the weather at the airport to see if landing is possible' do
      dummy_airport = Airport.new
      dummy_airport.set_weather("Storm")
      dummy_plane = double(:plane)
      expect { subject.land?(dummy_plane, dummy_airport) }.to raise_error "The conditions are too bad to land"
    end

    it 'lands the plane at the airport' do
      dummy_airport = Airport.new
      dummy_plane = double(:plane)
      expect(subject.land?(dummy_plane, dummy_airport)).to eq dummy_airport.planes_at_airport
    end
  end

  describe "#take_off?" do
    it 'checks the weather to see if take off is possible' do
      dummy_airport = Airport.new
      dummy_airport.set_weather("Storm")
      dummy_plane = double(:plane)
      expect { subject.take_off?(dummy_plane, dummy_airport) }.to raise_error "The conditions are too bad to take off"
    end
  end

  describe "#check_planes" do
    it 'allows the air traffic controller to check what planes are stationed at the airport' do
      dummy_airport = Airport.new
      dummy_plane = double(:plane)
      dummy_airport = double(:airport, planes_at_airport: dummy_plane)
      expect(subject.check_planes(dummy_airport)).to eq dummy_airport.planes_at_airport
    end
  end

end
