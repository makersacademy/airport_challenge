require "airport"

describe Airport do

  describe "#land(plane, weather)" do
    context "with good weather" do
      it "returns :successful when a plane is landed at the airport" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        expect(subject.land(plane, weather)).to eq :successful
      end

      it "returns :plane_already_landed when plane is already at airport" do
        plane = double(:plane)
        weather = double(:weather, stormy?: false)
        subject.land(plane, weather)
        expect(subject.land(plane, weather)).to eq :plane_already_landed
      end

      context "when capacity is specified" do
        it "returns :cannot_land_plane if airport is at full capacity" do
          weather = double(:weather, stormy?: false)
          planes = []
          capacity = 50
          capacity.times { planes << double(:plane) }
          airport = Airport.new(capacity)
          planes.each { |plane| airport.land(plane, weather) }
          last_plane = double(:plane)
          expect(airport.land(last_plane, weather)).to eq :cannot_land_plane
        end
      end

      context "when capacity is set to the default" do
        it "returns :cannot_land_plane if airport is at full capacity" do
          weather = double(:weather, stormy?: false)
          planes = []
          airport = Airport.new
          capacity = Airport::DEFAULT_CAPACITY
          capacity.times { planes << double(:plane) }
          planes.each { |plane| airport.land(plane, weather) }
          last_plane = double(:plane)
          expect(airport.land(last_plane, weather)).to eq :cannot_land_plane
        end
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

end
