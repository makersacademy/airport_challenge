require "airport"

describe Airport do

  describe "#land(plane)" do
    it "returns :successful when a plane is landed at the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq :successful
    end

    it "returns :cannot_land_plane if airport is at full capacity when capacity is specified" do
      capacity = 50
      airport = Airport.new(capacity)
      capacity.times { airport.land(Plane.new) }
      expect(airport.land(Plane.new)).to eq :cannot_land_plane
    end

    it "returns :cannot_land_plane if airport is at default capacity" do
      airport = Airport.new
      capacity = Airport::DEFAULT_CAPACITY
      capacity.times { airport.land(Plane.new) }
      expect(airport.land(Plane.new)).to eq :cannot_land_plane
    end
  end

  describe "#takeoff(plane, weather)" do
    it "returns :successful when a plane takes off from the airport in good weather" do
      plane = double(:plane)
      weather = double(:weather, stormy?: false)
      expect(subject.takeoff(plane, weather)).to eq :successful
    end

    it "returns :cannot_take_off when the weather is stormy" do
      plane = double(:plane)
      weather = double(:weather, stormy?: true)
      # allow(weather).to receive(:weather_forecast).and_return(2)
      expect(subject.takeoff(plane, weather)).to eq :cannot_take_off
    end
  end

  describe "#full?" do
    it "returns true if airport has reached capacity" do
      capacity = Airport::DEFAULT_CAPACITY
      airport = Airport.new
      capacity.times { airport.land(Plane.new) }
      expect(airport.full?).to eq true
    end
  end

end
