require_relative 'airport'

class Plane
    attr_reader :location

    def initialize
        @location = :grounded
    end
    
    def land
        @location = :grounded
    end

    def take_off
        @location = :airborne
    end

    def in_airport?
        return false if @location == :airborne 
        true
    end

end