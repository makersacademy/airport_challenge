require 'air_traffic_controller'
require_relative '../lib/airplane'
require_relative '../lib/airport'

describe AirTrafficController do
  let(:plane) { AirPlane.new }
  let(:airport) { Airport.new }
  context "The tests for the air traffic controller's functionality" do
    it "lands a plane at the airport" do
      allow(airport).to receive(:rand) { 1 }
      subject.land_plane(plane, airport)
      expect(airport.planes).to eq([plane])
    end

    it "takes off a plane from the airport" do
      allow(airport).to receive(:rand) { 1 }
      subject.land_plane(plane, airport)
      expect(subject.take_off_plane(plane, airport)).to eq(plane)
    end

    it "ensures the plane is no longer in the airport after taking off" do
      allow(airport).to receive(:rand) { 1 }
      subject.land_plane(plane, airport)
      expect(subject.take_off_plane(plane, airport)).to eq(plane)
      expect(airport.planes).to eq([])
    end

    it "prevents a plane from landing when the airport is full" do
      stormy_airport = Airport.new
      allow(stormy_airport).to receive(:rand) { 10 }
      expect(subject.land_plane(plane, stormy_airport)).to eq("It's too stormy, can't land!")
    end

    it "Stops planes from taking off when the weather is stormy" do
      stormy_airport = Airport.new
      #makes the weather not stormy so it can receive a plane
      allow(stormy_airport).to receive(:rand) { 1 }
      subject.land_plane(plane, stormy_airport)
      #makes the weather stormy so the error message will be returned
      allow(stormy_airport).to receive(:rand) { 10 }
      expect(subject.take_off_plane(plane, stormy_airport)).to eq("It's too stormy, can't takeoff!")
    end

    it "stops planes from taking off when they're in the air" do
      expect{subject.take_off_plane(plane, airport)}.to raise_error
    end
  end
end
