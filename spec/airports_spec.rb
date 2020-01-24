require "airplanes"
require "airports"
require "weather_forecast"
plane = Airplane.new
airport = Airport.new(20)
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
    end
    describe "#take_off" do
        it "Should be able to have a plane take off from an airport" do
            airport = Airport.new
            airport.land(plane)
            expect(airport.take_off).to eq(plane)
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
describe Weather_forecast do
    it "Should be stormy some of the time" do
        today = weather_forecast.new
        expect(today.forecast?).to eq "Stormy"
    end
    it "Should be sunny some of the time" do
        today = weather_forecast.new
        expect(today.forecast?).to eq "Sunny"
    end
end