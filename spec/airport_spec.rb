require 'airport'
require 'plane'
require 'pry'

describe Airport do
  let(:weather_generator) { double :weather_generator }
  let(:plane) { double :plane }
  describe "landing and take off" do
    it "should store landed planes" do
      airport = Airport.new(weather_generator)
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport.receive_plane(plane)
      expect(airport.stored_planes).to eq [plane]
    end
    it "should not store a landed plane after take off" do
      airport = Airport.new(weather_generator)
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport.receive_plane(plane)
      airport.release_plane(plane)
      expect(airport.stored_planes).to eq []
    end
  end

  describe "stormy weather" do
    it "should not allow the plane to take off if it's stormy" do
      airport = Airport.new(weather_generator)
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport.receive_plane(plane)
      allow(weather_generator).to receive(:generate_weather) { "stormy" }
      airport.release_plane(plane)
      expect(airport.stored_planes).to eq [plane]
    end
    it "should not allow the plane to land if it's stormy" do
      airport = Airport.new(weather_generator)
      allow(weather_generator).to receive(:generate_weather) { "stormy" }
      airport.receive_plane(plane)
      expect(airport.stored_planes).to eq []
    end
  end
end
