require "airplanes"
require "airports"
require "weather"
plane = Airplane.new
airport = Airport.new
airport.weather = "Sunny"
describe Airplane do
    describe "#land" do
        it "Should be able to land a plane at an airport" do
            airport.land(plane)
            expect(airport.planes[0]).to eq(plane)
        end
        it "Should raise an error when trying to land a plane at a full station" do
            20.times{ airport.land(plane) }
            expect{ airport.land(plane) }.to raise_error("Airport is at capacity")
        end
        it "Should raise an error if trying to land whilst it is stormy" do
            airport.weather = "Stormy"
            expect { airport.land(plane) }.to raise_error "Cannot land due to adverse weather conditions"
        end
    end
    describe "#take_off" do
        it "Should be able to have a plane take off from an airport" do
            airport = Airport.new
            airport.weather = "Sunny"
            airport.land(plane)
            expect(airport.take_off).to eq(plane)
        end
        it "Should raise an error if trying to take off whilst it is stormy" do
            airport.weather = "Stormy"
            expect { airport.take_off }.to raise_error "Cannot take off due to adverse weather conditions"
        end
    end
    describe "default capacity" do
        it "Should provide a default capacity for an airport" do
            airport = Airport.new
            expect(airport.capacity).to eq(20)
        end
    end
    describe "alter capacity" do
        it "Should be able to alter the default capacity of an airport" do
            airport = Airport.new(30)
            expect(airport.capacity).to eq(30)
        end
    end
end
