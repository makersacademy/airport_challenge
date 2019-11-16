require "airport"

describe Airport do

  describe "#land(plane, weather)" do
    context "with good weather" do
      it "returns :successful when a plane is landed at the airport" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        expect(subject.land(plane, weather)).to eq :successful
      end

      it "returns :cannot_land_plane if airport is at full capacity when capacity is specified" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        capacity = 50
        airport = Airport.new(capacity)
        capacity.times { airport.land(plane, weather) }
        expect(airport.land(plane, weather)).to eq :cannot_land_plane
      end

      it "returns :cannot_land_plane if airport is at default capacity" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        airport = Airport.new
        capacity = Airport::DEFAULT_CAPACITY
        capacity.times { airport.land(plane, weather) }
        expect(airport.land(plane, weather)).to eq :cannot_land_plane
      end
    end

    it "returns :cannot_land_plane when the weather is stormy" do
      plane = double(:plane)
      weather = double(:weather, stormy?: true)
      expect(subject.land(plane, weather)).to eq :cannot_land_plane
    end

  end

  describe "#takeoff(plane, weather)" do
    context "with good weather" do
      it "returns :successful when a plane takes off from the airport" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        expect(subject.takeoff(plane, weather)).to eq :successful
      end
    end

    it "returns :cannot_take_off when the weather is stormy" do
      plane = double(:plane)
      weather = double(:weather, stormy?: true)
      expect(subject.takeoff(plane, weather)).to eq :cannot_take_off
    end
  end

  describe "#full?" do
    context "with good weather" do
      it "returns true if airport has reached capacity" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        capacity = Airport::DEFAULT_CAPACITY
        airport = Airport.new
        capacity.times { airport.land(plane, weather) }
        expect(airport.full?).to eq true
      end
    end
  end

end
