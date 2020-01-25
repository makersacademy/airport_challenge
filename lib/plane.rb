# require_relative 'airport'

class Plane
    attr_reader :location

    def initialize
        @location = nil
    end
    
    def land
        fail "Plane already grounded" if grounded?
        @location = :grounded
    end

    def take_off
        fail "Plane already airborne" if flying?
        @location = :airborne
    end

    def flying?
        @location == :airborne ? true : false
    end

    def grounded?
        @location == :grounded ? true : false
    end

end