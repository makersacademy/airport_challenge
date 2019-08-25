require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let (:weather) { double :weather }

  it "tracks a plane that is flying to it" do
    plane = Plane.new
    airport = Airport.new(weather)
    airport.track_plane(plane)
    expect(airport.planes).to include plane
  end

  describe "landing" do

    it "instructs a plane to land at an airport" do
      allow(weather).to receive(:weather_condition) { :sunny }

      plane = Plane.new
      airport = Airport.new(weather)
      airport.instruct_landing(plane)

      expect(plane.is_flying).to eq false
    end

    it "will prevent a plane from landing when the weather is stormy" do
      allow(weather).to receive(:weather_condition) { :stormy }

      plane = Plane.new
      airport = Airport.new(weather)

      expect { airport.instruct_landing(plane) }.to raise_error "Stormy conditions"
    end

  end

  describe "takeoff" do

    it "instructs take off when the weather is sunny" do
      allow(weather).to receive(:weather_condition) { :sunny }

      plane = Plane.new
      airport = Airport.new(weather)
      airport.track_plane(plane)
      airport.instruct_landing(plane)
      airport.instruct_take_off(plane)

      expect(airport.planes).to_not include plane
    end

    it "will prevent take off when the weather is stormy" do
      allow(weather).to receive(:weather_condition) { :stormy }

      plane = Plane.new
      airport = Airport.new(weather)

      expect { airport.instruct_take_off(plane) }.to raise_error "Stormy conditions"
    end

  end

end
