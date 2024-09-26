require './lib/plane.rb'

class Airport
    attr_reader :planes_arr

    def initialize
        @planes_arr = []
    end

    def land_at_airport(plane)
        @planes_arr << plane
    end

    def take_off(plane)
        @planes_arr.pop
    end

    def check_weather(weather)
        fail "Plane cannot take off" if weather == "Stormy"
        @planes_arr.pop
    end
end

airport = Airport.new 
plane_one = Plane.new
plane_one_num = plane_one.generate_flight_number
plane_two = Plane.new
plane_two_num = plane_two.generate_flight_number
airport.land_at_airport(plane_one)
airport.land_at_airport(plane_two)
puts airport.planes_arr
airport.take_off(plane_one)
puts airport.planes_arr