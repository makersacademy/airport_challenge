require_relative 'airport.rb'

class Controller

    attr_reader :airport

    def initialize
        @airport = Airport.new
    end

    def request_landing(plane)
        plane.land
        @airport.plane_landing(plane)
    end

    def request_take_off(plane)
        plane.take_off
        @airport.plane_taking_off(plane)
    end
end