require 'airport'
require 'plane'

RSpec.describe Airport do
  let(:test_plane) { Plane.new }
  let(:test_airport) { Airport.new }
  it "should harbour planes" do
    expect(subject).to respond_to(:harbour_plane).with(1).arguments
  end

  it "should commission flights" do
    expect(subject).to respond_to(:commission_flight).with(1).arguments
  end
  
  context "#capacity" do
    it "should have a maximum capacity of 100 planes" do
      expect(subject).to respond_to(:capacity)
    end

    it "should be able to be overwritten" do
      custom_airport = Airport.new(600)

      expect(test_airport.capacity).to eq(100)
      expect(custom_airport.capacity).to eq(600)
    end
  end

  context "when harbouring planes" do
    it "should deny landing if airport is full" do
      100.times { test_airport.harbour_plane(test_plane) }

      expect { test_airport.harbour_plane(test_plane) }.to raise_error Errors::AT_CAPACITY
    end
  end

  context "after commissioning a flight" do
    let(:test_plane_2) { Plane.new }

    it "should not have the commissioned plane in the airport" do
      test_airport.harbour_plane(test_plane)
      test_airport.harbour_plane(test_plane_2)

      test_airport.commission_flight(test_plane)

      expect(test_airport.planes).not_to include(test_plane)
    end

    it "should not be able to commission the same plane while airborne" do
      test_airport.harbour_plane(test_plane)
      test_airport.commission_flight(test_plane)

      expect { test_airport.commission_flight(test_plane) }.to raise_error Errors::NOT_AT_AIRPORT
    end
  end
end
