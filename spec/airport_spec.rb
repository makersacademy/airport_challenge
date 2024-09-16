require "Airport"
require "weather"
require "plane"
test_airport = nil


describe "Airport" do
    let (:new_plane) {double :plane}
    before(:each) do
        current_weather = Weather.new
        test_airport = Airport.new(new_plane, current_weather)
    end
    
    it "will create an instance of Airport when run" do
        expect(test_airport.is_a? Object).to eq true
    end

    it "will allow a plane to land in the airport" do
        test_airport.plane_land(new_plane)
        expect(test_airport.get_landed_planes.length).to eq 1
    end

    it "will return a raised error when trying to land plane at a full airport" do
        (test_airport.capacity).times do 
            test_airport.plane_land(new_plane)
        end
        expect{test_airport.plane_land(new_plane)}.to raise_error("The airport is full")
    end

    it "will not allow a plane to land when the weather is bad" do
        current_weather = Weather.new
        current_weather.weather_is_stormy
        test_airport = Airport.new(new_plane, current_weather)
        expect{test_airport.plane_land(new_plane)}.to raise_error("Weather warning, cannot land plane")
    
    end

    it "will allow a plane to take off" do
        current_weather = Weather.new
        test_airport = Airport.new(new_plane, current_weather)
        3.times do 
            test_airport.plane_land(new_plane)
        end
        test_airport.plane_takeoff
        expect(test_airport.landed_planes.length).to eq 2
    end
    it "will return a raised error when trying to make a plane take off at an empty airport" do
        expect{test_airport.plane_takeoff}.to raise_error("No planes in the airport")
    end
    it "will not allow a plane to take off when the weather is bad" do
        current_weather = Weather.new
        current_weather.weather_is_stormy
        test_airport = Airport.new(new_plane, current_weather)
        expect{test_airport.plane_takeoff}.to raise_error("Weather warning, plane cannot take off")
    
    end
end