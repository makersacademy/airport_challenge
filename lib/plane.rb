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
        raise 'The plane is not in this airport' if not_same(airport)
        @status = 'flying'
        @location = 'in air'
        true
    end

    private

    def not_same(airport)
        return true if airport != @location
    end

end