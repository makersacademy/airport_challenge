require 'Airport'
require 'Plane'

describe Airport do
    let(:airport) {Airport.new}
    let(:plane) {Plane.new}

    describe "Check airplane array" do
      it "Returns false when a specific airplane is not in the airport" do
        # Create new plane and ask airport if it is in the airport
        expect(airport.in_airport?(plane)).to eq false
      end
        
      it "Returns 0 when aiport is empty" do
        expect(airport.count_planes).to eq 0
      end
    end

    describe "max_capacity" do
      it "Returns that the airport is not full" do
        expect(airport.capacity_max?).to eq false
      end

      it "Returns that the airport is full" do
        airport.load_planes(5)
        # add 5 (default capacity) new planes to the airport
        expect(airport.capacity_max?).to eq true
      end

      it "When the max capacity is overrided, it changes whether the airport is full accordingly" do
        airport.override_max_capacity(2)
        airport.load_planes(2)
        # add 2 new planes to the airport
        expect(airport.capacity_max?).to eq true
      end
    end
    
    describe "Add and remove plane from airplanes array" do
      it "Loads 5 airplanes into the airport" do
        airport.load_planes(5)
        expect(airport.count_planes).to eq 5
      end

      it "Lets a plane be landed" do
        airport.land_plane(plane)
        expect(airport.in_airport?(plane)).to eq true
      end

      it "Lets a plane take off" do 
        airport.load_planes(3)
        airport.take_off_plane(plane)
        expect(airport.in_airport?(plane)).to eq false
      end
    end
end