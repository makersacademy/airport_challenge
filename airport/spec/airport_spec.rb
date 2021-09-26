require 'airport'
require 'plane'

describe Airport do

    plane = Plane.new
    airport = Airport.new
    it "allows a plan to land" do
        airport.land(plane)
        expect(airport.planes.first).to eq(plane)
    end

    it "allows plane to take off" do
        airport = Airport.new([plane])
        airport.take_off(plane)
        expect(airport.planes).to be_empty
    end

    it "does not allow planes to land when airport is full (20 planes)" do
        Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
        expect { airport.land Plane.new }.to raise_error("Plane cannot land since airport is full")
    end

    it "prevents takeoff when weather is stormy" do 
        airport = Airport.new([plane], 20, :stormy)
        expect { airport.take_off(plane) }.to raise_error("Plane cannot take off in stormy weather")
    end
    
    it "prevents landing when weather is stormy" do 
        airport = Airport.new([], 20, :stormy)
        expect { airport.land(plane) }.to raise_error("Plane cannot land in stormy weather")
    end
end