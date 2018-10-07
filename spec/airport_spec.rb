require 'airport'
require 'pry'

describe Airport do
  
  let(:weather_generator) { double :weather_generator }
  let(:plane) { double :plane }

  describe "landing and take off" do
    it "should store landed planes" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      allow(plane).to receive(:flying?) { true }
      airport = Airport.new(weather_generator, [])
      airport.receive_plane(plane)
      expect(airport.stored_planes).to eq [plane]
    end

    it "should not store a landed plane after releasing it" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [plane])
      airport.release_plane(plane)
      expect(airport.stored_planes).to eq []
    end
  end

  describe "edge cases" do
    it "should only release a plane that is already in the airport" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [])
      expect { airport.release_plane(plane) }.to raise_error "Plane not in airport"
    end

    it "should not receive a plane that is already in the airport" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [plane])
      expect { airport.receive_plane(plane) }.to raise_error "Plane already in airport"
    end

    it "should not receive a plane if it has already landed" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      allow(plane).to receive(:flying?) { false }
      airport = Airport.new(weather_generator, [])
      expect(airport.receive_plane(plane)).to eq []
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

  describe "airport capacity" do
    it "should not receive planes when full" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      allow(plane).to receive(:flying?) { true }
      airport = Airport.new(weather_generator, [])
      Airport::DEFAULT_CAPACITY.times {
        different_plane = double(:plane)
        allow(different_plane).to receive(:flying?) { true }
        airport.receive_plane(different_plane)
      }
      expect { airport.receive_plane(plane) }.to raise_error "Airport full"
    end

    it "allows user to set default capacity" do
      allow(weather_generator).to receive(:generate_weather) { "clear" }
      airport = Airport.new(weather_generator, [], 2)
      airport.capacity.times {
        different_plane = double(:plane)
        allow(different_plane).to receive(:flying?) { true }
        airport.receive_plane(different_plane)
      }
      expect { airport.receive_plane(plane) }.to raise_error "Airport full"
    end

    it "allows user to override default capacity" do
      allow(weather_generator).to receive(:generate_weather)
      airport = Airport.new(weather_generator, [])
      airport.change_capacity(2)
      expect(airport.capacity).to eq 2
    end
  end
end
