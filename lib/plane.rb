require_relative 'airport'

class Plane

    attr_reader :status, :location, :destination, :passengers

    def initialize
        @status = 'landed'
        @location = Airport.new
        @destination = Airport.new
        @passengers = rand(101)
    end

    def take_off(airport)
        if airport == @location
            @status = 'flying'
            @location = 'in air'
            true
        end
    end
end