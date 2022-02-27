require 'air_traffic_controller'
require_relative '../lib/airplane.rb'
require_relative '../lib/airport.rb'

describe AirTrafficController do
  let(:plane) {AirPlane.new}
  let(:airport) {Airport.new}
  context "The tests for the air traffic controller's functionality" do
    it "lands a plane at the airport" do
      # allow(:airport).to receive(:stormy?) { true }
    subject.land_plane(plane, airport)
    expect(airport.planes).to eq([plane])
    end

    it "takes off a plane from the airport" do
      subject.land_plane(plane, airport)
      expect(subject.take_off_plane(plane, airport)).to eq(plane)
    end

    it "ensures the plane is no longer in the airport after taking off" do
      subject.land_plane(plane, airport)
      expect(subject.take_off_plane(plane, airport)).to eq(plane)
      expect(airport.planes).to eq([])
    end

    it "prevents a plane from landing when the airport is full" do
      stormy_airport = Airport.new
      allow(:stormy_airport).to receive(:rand) { 10 }
      expect(subject.land_plane(plane, stormy_airport)).to eq("it's too stormy, can't land!")
    end

    it "Stops planes from taking off when the weather is stormy" do
      stormy_airport = Airport.new
      allow(:stormy_airport).to receive(:rand) { 5 }
      subject.land_plane(plane, stormy_airport)
      allow(:stormy_airport).to receive(:rand) { 10 }
      expect(subject.take_off_plane(plane, stormy_airport)).to eq("it's too stormy, can't takeoff!")
    end
  end
end