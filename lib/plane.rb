require_relative 'airport'

class Plane

    attr_reader :status, :location, :destination, :passengers

    def initialize
        @status = 'landed'
        @location = Airport.new
        @destination = Airport.new
        @passengers = load_passengers

        @location.place(self)
    end

    def take_off
        raise 'The plane cannot take off while flying' if flying?
        location.take_off(self)
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
        @passengers = load_passengers
        print_passengers
    end

    def load_passengers
        @passengers = rand(1..100)
    end
    
    private

    def print_passengers
        "There are #{@passengers} passengers on this plane"
    end

    def landed?
        @status == 'landed'
    end

    def flying?
        @status == 'flying'
    end

end