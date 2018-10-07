require 'airport'
require 'plane'
require 'pry'

describe Airport do
  let(:weather_generator) { double :weather_generator }
  let(:plane) { double :plane }
  describe "landing and take off" do
    it "should store landed planes" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [])
      airport.receive_plane(plane)
      expect(airport.stored_planes).to eq [plane]
    end

    it "should not store a landed plane after releasing it" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [])
      airport.receive_plane(plane)
      airport.release_plane(plane)
      expect(airport.stored_planes).to eq []
    end

    it "should only release a plane that is already in the airport" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [])
      expect { airport.release_plane(plane) }.to raise_error "Plane not in airport"
    end
  end

  describe "stormy weather" do
    it "should not release a plane if it's stormy" do
      allow(weather_generator).to receive(:generate_weather) { "stormy" }
      airport = Airport.new(weather_generator, [plane])
      airport.release_plane(plane)
      expect(airport.stored_planes).to eq [plane]
    end
    it "should not receive a plane if it's stormy" do
      allow(weather_generator).to receive(:generate_weather) { "stormy" }
      airport = Airport.new(weather_generator, [])
      airport.receive_plane(plane)
      expect(airport.stored_planes).to eq []
    end
  end
end
