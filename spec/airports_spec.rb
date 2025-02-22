require "airplanes"
require "airports"
airport = Airport.new(20)
airport.weather = "Sunny"
describe Airport do
    describe "#land" do
        it "Should be able to land a plane at an airport" do
            plane = Airplane.new
            airport.land(plane)
            expect(airport.planes[0]).to eq(plane)
        end
        it "Should raise an error when trying to land a plane at a full station" do
            plane = Airplane.new
            20.times{ airport.land(Airplane.new) }
            expect{ airport.land(plane) }.to raise_error("Airport is at capacity")
        end
        it "Should raise an error if trying to land whilst it is stormy" do
            plane = Airplane.new
            airport.weather = "Stormy"
            expect { airport.land(plane) }.to raise_error "Cannot land due to adverse weather conditions"
        end
    end
    describe "#take_off" do
        it "Should be able to have a plane take off from an airport" do
            plane = Airplane.new
            airport = Airport.new
            airport.weather = "Sunny"
            airport.land(plane)
            expect(airport.take_off).to eq(plane)
        end
        it "Should raise an error if trying to take off whilst it is stormy" do
            plane = Airplane.new
            airport.weather = "Stormy"
            expect { airport.take_off }.to raise_error "Cannot take off due to adverse weather conditions"
        end
    end
    describe "default capacity" do
        it "Should provide a default capacity for an airport" do
            plane = Airplane.new
            airport = Airport.new
            expect(airport.capacity).to eq(20)
        end
    end
    describe "alter capacity" do
        it "Should be able to alter the default capacity of an airport" do
            plane = Airplane.new
            airport = Airport.new(30)
            expect(airport.capacity).to eq(30)
        end
    end
end
