require 'airport'
require 'planes'
require 'air_traffic_controller'

describe Airport do

  describe "#name" do
    it "returns the correct name" do
      test_airport = Airport.new("Name")
      expect(test_airport.name).to eq "Name"
    end
  end

  describe "#initialize" do
    it "gives the airport a default capacity of 20 when initializing" do
      expect(subject.capacity).to eq (20)
    end

    it "allows the user to set a capacity" do
      test_airport = Airport.new("London", 14)
      expect(test_airport.capacity).to eq (14)
    end
  end

  describe "#land_plane" do
    it "adds the specific plane to the planes at the airport" do
      dummy_plane = double(:plane)
      subject.land_plane(dummy_plane)
      expect(subject.planes_at_airport).to include dummy_plane
    end
  end

  describe "#take_off_plane" do
    it "removes the plane from the airport" do
      dummy_plane = double(:plane)
      subject.planes_at_airport << dummy_plane
      subject.take_off_plane(dummy_plane)
      expect(subject.planes_at_airport).to_not include dummy_plane
    end
  end

  describe "#set_weather" do
    it "allows the weather to be changed" do
      expect(subject.set_weather("Test")).to eq "Test"
    end
  end

end
