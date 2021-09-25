require 'airport'
require 'plane'

describe Airport do
    it "allows a plan to land" do
        airport = Airport.new
        plane = Plane.new
        airport.land(plane)
        expect(airport.planes.first).to eq(plane)
    end

    it "allows plane to take off" do
        plane = Plane.new
        airport = Airport.new([plane])
        airport.take_off(plane)
        expect(airport.planes).to be_empty
    end

    it "does not allow planes to land when airport is full" do 
        airport = Airport.new
        5.times { 
        plane = Plane.new
        airport.land(plane) 
        }
        plane6 = Plane.new 
        expect { airport.land(plane6) }.to raise_error("Plane cannot land since airport is full")
    end
end