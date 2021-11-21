require_relative 'airport.rb'
require_relative 'weather.rb'

class Controller
    include Weather
    attr_reader :airport
    attr_reader :other_airports
    attr_reader :other_airport_names
    attr_reader :planes_in_sky

    def initialize(capacity = 20)
        @airport = Airport.new(capacity)
        @other_airports = []
        @other_airport_names = []
        @planes_in_sky = []
    end

    def create_new_airport(capacity = 20, airport_name)
        unless (@other_airport_names.include?(airport_name) || airport.name == airport_name)
            @new_airport = Airport.new(capacity,airport_name)
            @other_airports << @new_airport
            @other_airport_names << airport_name
        else
            raise "That airport exists!"
        end
    end

    def change_airport_using(new_name)
        if @other_airport_names.include?(new_name)
            index = @other_airport_names.index(new_name)
            puts @other_airports[index]
            @other_airports << @airport
            @other_airport_names << @airport.name
            @airport = @other_airports[index]
            @other_airports.delete_at(index)
            @other_airport_names.delete_at(index)
            puts @airport
        else
            raise "That's not an airport I know!"
        end
    end

    def request_landing(plane)
        weather = weather?
        if weather? == "Stormy"
            raise "It's too stormy to land!"
        end
        @airport.plane_landing(plane)
    end

    def request_take_off(plane)
        weather = weather?
        if weather? == "Stormy"
            raise "It's too stormy to take off!"
        end
        @airport.plane_taking_off(plane)
    end

    def new_plane_in_sky
        plane = Plane.new
        @planes_in_sky << plane
    end

    def new_plane_in_airport
        plane = Plane.new
        request_landing(plane)
    end
end