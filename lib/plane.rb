require_relative 'airport'

class Plane

    attr_reader :status, :location, :destination, :passengers

    def initialize
        @status = 'landed'
        @location = Airport.new
        @destination = Airport.new
        @passengers = rand(1..100)

        @location.place(self)
    end

    def take_off(airport)
        raise 'The plane cannot take off while flying' if flying?
        raise 'The plane is not in this airport' if not_same(airport)
        @status = 'flying'
        @location = 'in air'
        true
    end

    def land_at_destination
        raise 'A landed plane cannot land' if landed?
        @destination.land(self)

        @status = 'landed'
        @location = @destination
        @destination = Airport.new
        @passengers = rand(101)
    end

    private

    def landed?
        @status == 'landed'
    end

    def flying?
        @status == 'flying'
    end

    def not_same(airport)
        airport != @location
    end

end